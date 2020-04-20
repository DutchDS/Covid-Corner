import pandas as pd
import os
from datetime import datetime, timedelta
from sqlalchemy import create_engine


# Create a POSTGRES database with the name 'COVID19_db'
# Replace username:password if it's not set to postgres:postgres
DATABASE_URI = os.environ.get('DATABASE_URL', '') or "postgresql://postgres:postgres@localhost:5432/COVID19_db"
print(DATABASE_URI)

engine = create_engine(DATABASE_URI)


# REALTIME DOWNLOADS
url_covid = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/'
url_covid_states = 'https://raw.githubusercontent.com/COVID19Tracking/covid-tracking-data/master/data/states_daily_4pm_et.csv'

# Find last time covid_data was loaded
query_str = open('static/sql/max_db_date.sql')
query_text = ""
for text in query_str:
    query_text = query_text + text

rs = engine.execute(query_text)

for i in rs:
    last_db_date = (i[0])
print(last_db_date)

current_date = datetime.today().date()
print(current_date)

# Test data statistics
df_covid_states = pd.DataFrame()
df_covid_states = pd.read_csv(url_covid_states).fillna(0)

df_covid_states['date'] = pd.to_datetime(df_covid_states['date'],format='%Y%m%d')
df_covid_states['dateChecked'] = pd.to_datetime(df_covid_states['dateChecked']).dt.date
df_covid_states = df_covid_states.drop(['hash'], axis=1)
df_covid_states = df_covid_states.rename(columns = {
        'hospitalizedCurrently':'hospitalized_curr','hospitalizedCumulative':'hospitalized_cum',
        'inIcuCurrently':'in_ICU_curr','inIcuCumulative':'in_ICU_cum',
        'onVentilatorCurrently':'on_vent_curr','onVentilatorCumulative':'on_vent_cum',
        'total':'dontuse_total','dateChecked':'check_date','totalTestResults':'total_tests','posNeg':'pos_neg','deathIncrease':'death_inc',
        'hospitalizedIncrease':'hospital_inc','negativeIncrease':'neg_inc','positiveIncrease':'pos_inc',
        'totalTestResultsIncrease':'tot_tests_inc'})

df_covid_states = df_covid_states[df_covid_states['date']<=current_date]
df_covid_states = df_covid_states[df_covid_states['date']>last_db_date]

# engine.execute( '''TRUNCATE TABLE covid_data_states''' )
df_covid_states.to_sql(name='covid_data_states', con=engine, if_exists='append', index=False)


# Read data into Dataframes
df_covid_phase0 = pd.DataFrame()
df_covid_phase1 = pd.DataFrame()
df_covid_phase2 = pd.DataFrame()
df_covid_phase3 = pd.DataFrame()
df_covid_phase4 = pd.DataFrame() 

# Reset last_db_date only for inital load. Then leave it to setting at start
# last_db_date = datetime.strptime('01-22-2020',"%m-%d-%Y").date()
yesterday_date = datetime.today().date() + timedelta(days=-1)
loop_date = last_db_date + timedelta(days=+1)

print("Last Date in DB:", last_db_date)
print("Yesterday's Date:", yesterday_date)

if last_db_date < yesterday_date:

    while loop_date <= yesterday_date:
        
        # Change to date format used in .csv files
        file_date = datetime.strftime(loop_date, "%m-%d-%Y")
        
        # Create URL and get data
        url_covid_file = url_covid + file_date + ".csv"
        print("Now processing: " + url_covid_file)
        df_covid_loop = pd.read_csv(url_covid_file)
        df_covid_loop['short_date'] = loop_date
        
        # Split 5 different formats based on date
        if loop_date < datetime.strptime('02-01-2020',"%m-%d-%Y").date(): 
            df_covid_phase0 = df_covid_phase0.append(df_covid_loop)
        elif loop_date <= datetime.strptime('02-29-2020',"%m-%d-%Y").date(): 
            df_covid_phase1 = df_covid_phase1.append(df_covid_loop)
        elif loop_date < datetime.strptime('03-10-2020',"%m-%d-%Y").date():
            df_covid_phase2 = df_covid_phase2.append(df_covid_loop)
        elif loop_date < datetime.strptime('03-22-2020',"%m-%d-%Y").date():
            df_covid_phase3 = df_covid_phase3.append(df_covid_loop)
        else:
            df_covid_phase4 = df_covid_phase4.append(df_covid_loop)
            
            
        # Get the next file
        loop_date = loop_date + timedelta(days=1)

    df_covid_phase4.fillna(0, inplace=True)
    df_covid_phase4['Confirmed'] = df_covid_phase4['Confirmed'].astype(int)
    df_covid_phase4['Deaths'] = df_covid_phase4['Deaths'].astype(int)
    df_covid_phase4['Recovered'] = df_covid_phase4['Recovered'].astype(int)
    df_covid_phase4['Active'] = df_covid_phase4['Active'].astype(int)
    df_covid_phase4 = df_covid_phase4.rename(columns = {'Province_State':'province_state','Country_Region':'country_region', 'Confirmed':'confirmed','Deaths':'deaths','Active':'active','Recovered':'recovered','Lat':'latitude','Long_':'longitude','Admin2':'us_county'})

    df_covid_4 = df_covid_phase4[['province_state','country_region','confirmed','deaths','recovered','active','short_date','latitude','longitude','us_county']]

    df_covid_4.to_sql(name='covid_data_4', con=engine, if_exists='append', index=False) 

    df_covid_4.head()
    result = "Data Loaded"

    print(result)
