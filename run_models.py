# Load Libraries
import os
import pandas as pd
# import tensorflow as tf
# import keras
# from tensorflow import keras
# from keras.models import load_model
# from keras.models import Sequential
# from keras.utils import to_categorical
# from keras.layers import Dense
import numpy as np
import joblib
import random

# Model 1: Classification
def model1(selFeatures):
    Feature_list=[int(i) for i in selFeatures]

    test=np.array(Feature_list, dtype=np.int32).reshape(1,-1)

    # Load the models
    model1 = joblib.load("static/model/best_clf.sav") 
        
    prediction1 = model1.predict(test)
    print(prediction1)

    return prediction1 

# Model 2: Deep Learning
# def model2(selFeatures):
 
#     Feature_list=[int(i) for i in selFeatures]

#     test=np.array(Feature_list, dtype=np.int32).reshape(1,-1)

#     # Load the models
#     # model2 = keras.models.load_model("static/model/best_dl.h5") 
#     model1 = joblib.load("static/model/best_clf.sav") 
        
#     prediction1 = model1.predict(test)    
#     # prediction2 = model2.predict_classes(test)
#     print(prediction1)

#     return prediction1

# Model 3: Random Forest
def model3(selFeatures):
    Feature_list=[int(i) for i in selFeatures]

    test=np.array(Feature_list, dtype=np.int32).reshape(1,-1)

    # Load the models
    model3 = joblib.load("static/model/best_rf.sav") 
        
    prediction3 = model3.predict(test)
    print(prediction3)

    return prediction3  

def model4(selFeatures):
    Feature_list=[int(i) for i in selFeatures]

    test=np.array(Feature_list, dtype=np.int32).reshape(1,-1)

    # Load the models
    model4 = joblib.load("static/model/best_knn.sav") 
        
    prediction4 = model4.predict(test)
    print(prediction4)

    return prediction4  
