import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from sklearn.preprocessing import LabelEncoder, OneHotEncoder
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.metrics import confusion_matrix

# import keras
from keras.models import Sequential
from keras.layers import Dense
# from keras.engine.network import to_json

dataset = pd.read_csv('../../../Datasets/Machine Learning A-Z/Part 8 - Deep Learning/Section 39 - Artificial Neural Networks (ANN)/Churn_Modelling.csv')

X = dataset.iloc[:, 3:13].values
y = dataset.iloc[:, 13].values

label_encoder_X_country = LabelEncoder()
label_encoder_X_gender = LabelEncoder()

X[:, 1] = label_encoder_X_country.fit_transform(X[:, 1])
X[:, 2] = label_encoder_X_gender.fit_transform(X[:, 2])

one_hot_encoder = OneHotEncoder(categorical_features=[1])

X = one_hot_encoder.fit_transform(X).toarray()
X = X[:, 1:]

# Scale the features
sc = StandardScaler()
X = sc.fit_transform(X)

# Split the dataset into training & testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=0)

# Build the ANN
my_classifier = Sequential()
# Input Layer & First Hidden Layer
num_features = X_train.shape[1]
my_classifier.add(Dense(6, input_shape = (num_features, ), activation = 'relu'))
# Second Hidden Layer
my_classifier.add(Dense(6, activation = 'relu'))
# Output Layer
num_classes = 1
my_classifier.add(Dense(num_classes, activation = 'sigmoid'))

my_classifier.compile('Adam', loss = 'binary_crossentropy', metrics=['accuracy'])

# Fit the model
my_classifier.fit(x=X_train, y=y_train, batch_size=200, epochs=20, verbose=1)

# Evaluate the model
scores = my_classifier.evaluate(x=X_test, y=y_test, batch_size=100, verbose=1)

# Predict an output
y_pred = my_classifier.predict(X_test)
y_pred = (y_pred > 0.5)

# Define the confusion matrix
cm = confusion_matrix(y_test, y_pred)
tp, fp, fn, tn = cm.ravel()

print('Accuracy is about {}%.' .format(100*(tp+tn)/sum((sum(cm)))))

print('\
The loss value is:\n {}.\n\n\
The accuracy percentage is:\n {}%. '.format(scores[0], 100*scores[1]))