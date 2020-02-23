# -*- coding: utf-8 -*-
"""
Created on Wed Oct 24 11:52:53 2018

@author: MHAMDI
"""

# Importi the Keras libraries and packages
from keras.models import Sequential
from keras.layers.convolutional import Conv2D, MaxPooling2D
from keras.layers.core import Dense, Flatten
from keras.preprocessing.image import ImageDataGenerator as IDG

from sklearn.metrics import confusion_matrix as cm

# Initialize the CNN
my_classifier = Sequential()
# Step 1a: Convolution
my_classifier.add(Conv2D(32, (3, 3), input_shape=(64, 64, 3), activation='relu'))
# Step 1b: Max Pooling
my_classifier.add(MaxPooling2D())
# Step 2a: Convolution
my_classifier.add(Conv2D(64, (3, 3), activation='relu'))
# Step 2b: Max Pooling
my_classifier.add(MaxPooling2D())
# Step 3: Faltten
my_classifier.add(Flatten())
# Step 4: Fully Connected Layers
my_classifier.add(Dense(128, activation = 'relu')) # First hidden layer
my_classifier.add(Dense(1, activation = 'sigmoid')) # Output: Dog or Cat 
# Compile the model
my_classifier.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])

''' Prepocess the data '''
dataset_path = '../../../Datasets/Machine Learning A-Z/Part 8 - Deep Learning/Section 40 - Convolutional Neural Networks (CNN)/dataset/'
train_path = dataset_path +'training_set/'
test_path = dataset_path +'test_set/'

data_gen = IDG(rotation_range=0.5,
               width_shift_range=0.2,
               zoom_range=0.2,
               horizontal_flip=True,
               rescale=1./255)
# Prepare the training dataset
train_set = data_gen.flow_from_directory(train_path, target_size=(64, 64), class_mode='binary')
# Prepare the test dataset
test_set = data_gen.flow_from_directory(test_path, target_size=(64, 64), class_mode='binary')
# Fit the training data
my_classifier.fit_generator(train_set,
                            epochs=25,
                            steps_per_epoch=8000,
                            validation_data=test_set,
                            validation_steps=2000)
# Predict the test set
# y_pred = my_classifier.predict_generator(test_set, verbose=1)
# Confusion matrix
# tp, fp, fn, tn = cm(y_test, y_pred)
# Evaluate the model
# print('Accuracy is about {}%.'.format{100*((tp+tn)/(tp+tn+fp+fn))})