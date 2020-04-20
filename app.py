# import necessary libraries
import os
from flask import (
    Flask,
    render_template,
    jsonify,
    request,
    redirect)
import pandas as pd
from sqlalchemy import create_engine
from flask_sqlalchemy import SQLAlchemy
import decimal
import flask.json
from run_models import model1, model3, model4
# import load_db

app = Flask(__name__)

DATABASE_URI = os.environ.get('DATABASE_URL', '') or "postgresql://postgres:postgres@localhost:5432/COVID19_db"
print(DATABASE_URI)

engine = create_engine(DATABASE_URI)

app.config['SQLALCHEMY_DATABASE_URI'] = DATABASE_URI 

db = SQLAlchemy(app)

@app.route("/")
def world():

    return render_template("Covid_Landing.html")

@app.route("/home")
def home():

    return render_template("Covid_Home.html")

@app.route("/team")
def team():
    return render_template("Covid_About.html")

@app.route("/risk")
def risk(): 
  
    return render_template("Covid_Risk.html")

@app.route("/viz")
def viz(): 
  
    return render_template("Covid_Viz.html")

@app.route("/forecast")
def forecast(): 
  
    return render_template("Covid_Forecast.html")

@app.route("/charts")
def charts(): 
  
    return render_template("Covid_Charts.html")

@app.route("/api/v1.0/<model>/<selFeatures>")
def model(model, selFeatures): 
    
    result=""
    if model == 'model1':
        result = model1(selFeatures)
    # elif model == 'model2':
    #     result = model2(selFeatures)
    elif model == 'model3':
        result = model3(selFeatures)
    else:
         result = model4(selFeatures)
    # print(result)
    # print(str(result[0]))
    # return jsonify(str(result[0]))

    pred_1 = model1(selFeatures)
    pred_3 = model3(selFeatures)
    pred_4 = model4(selFeatures)

    gen_age_features = str(selFeatures[:8])

    query_text = "select model, test_score from model_eval where features = '" + str(gen_age_features) + \
        "' and test_score = (select max(test_score) from model_eval where features = '" + str(gen_age_features) + "')"
    
    best_model_result = engine.execute(query_text)
    print(best_model_result)

    for model, test_score in best_model_result:
        results_dict = {}
        results_dict["model"] = model
        results_dict["test_score"] = test_score

    result_long = {}
    print("Dictionary", results_dict)
    if (results_dict['model'] == 'Decision Tree'):
        result_long = {"prediction" : str(pred_1[0]), "model" : results_dict['model'], "test_score" : results_dict['test_score']}
    elif (results_dict['model']  == 'Random Forest'):
        result_long = {"prediction" : str(pred_3[0]), "model" : results_dict['model'], "test_score" : results_dict['test_score']}
    else: 
        result_long = {"prediction" : str(pred_4[0]), "model" : results_dict['model'], "test_score" : results_dict['test_score']}
    
    print(result)
    print(result_long)
    x = (str(result[0]))
    print(x)
    return jsonify(result_long)


@app.route("/api/v1.0/bar_states")
def bar_states(): 
    result_set = []
    
    query_str = open('static/sql/bar_by_state.sql')
    query_text = ""
    
    for text in query_str:
        query_text = query_text + text
        
    result_set = engine.execute(query_text)
    
    all_results = []
    for date, state, pos_at_home, hospitalized_curr, recovered, death, new_cases, new_hospitalizations, new_deaths in result_set:
        results_dict = {}
        results_dict["date"] = date
        results_dict["state"] = state
        results_dict["pos_at_home"] = pos_at_home
        results_dict["hospitalized_curr"] = hospitalized_curr
        results_dict["recovered"] = recovered
        results_dict["death"] = death
        results_dict["new_cases"] = new_cases
        results_dict["new_hospitalizations"] = new_hospitalizations
        results_dict["new_deaths"] = new_deaths
        all_results.append(results_dict)

    return jsonify(all_results)


@app.route("/api/v1.0/bar_countries")
def bar_countries(): 
    result_set = []
    
    query_str = open('static/sql/bar_by_country.sql')
    query_text = ""
    
    for text in query_str:
        query_text = query_text + text
        
    result_set = engine.execute(query_text)
    
    all_results = []
    for date, country, positive, recovered, deceased in result_set:
        results_dict = {}
        results_dict["date"] = date
        results_dict["country"] = country
        results_dict["positive"] = positive
        results_dict["recovered"] = recovered
        results_dict["deceased"] = deceased
        all_results.append(results_dict)

    return jsonify(all_results)


    
@app.route("/api/v1.0/bar_counties")
def bar_counties(): 
    result_set = []
    
    query_str = open('static/sql/bar_by_county.sql')
    query_text = ""
    
    for text in query_str:
        query_text = query_text + text
        
    result_set = engine.execute(query_text)
    
    all_results = []
    for date, state, county, positive, recovered, deceased in result_set:
        results_dict = {}
        results_dict["date"] = date
        results_dict["state"] = state
        results_dict["county"] = county
        results_dict["positive"] = positive
        results_dict["recovered"] = recovered
        results_dict["deceased"] = deceased
        all_results.append(results_dict)

    return jsonify(all_results)

@app.route("/api/v1.0/counties_list")
def counties_list(): 
    result_set = []
    
    query_str = open('static/sql/counties_list.sql')
    query_text = ""
    
    for text in query_str:
        query_text = query_text + text
        
    result_set = engine.execute(query_text)
    
    all_results = []
    for state, county, date in result_set:
        results_dict = {}
        results_dict["state"] = state
        results_dict["county"] = county
        results_dict["date"] = date
        all_results.append(results_dict)

    return jsonify(all_results)


@app.route("/api/v1.0/bar_model/<selFeatures>")
def bar_model(selFeatures):
    
    features = str(selFeatures[:8])
    print(features)

    result_set = []
    
    # query_str = open('static/sql/USA_bar.sql')
    query_text = "select model, train_score, test_score from model_eval where features = '" + str(features) + \
        "' order by test_score desc"

    print(query_text)

    result_set = engine.execute(query_text)
    
    all_results = []
    for model, train_score, test_score in result_set:
        results_dict = {}
        results_dict["model"] = model
        results_dict["train_score"] = train_score
        results_dict["test_score"] = test_score
        all_results.append(results_dict)

    return jsonify(all_results)
