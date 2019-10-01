# -*- coding: utf-8 -*-
"""
Handwritten Digit Recognition using Convolutional Neural Networks  in Python with Keras

Created on Wed Oct 10 23:41:16 2018

@author: MHAMDI
"""
# %%
import numpy as np
from numpy import array

from matplotlib import pyplot as plt

from keras.datasets import mnist
from keras.models import Sequential
from keras.layers import Dense
from keras.layers import Dropout
from keras.layers import Flatten
from keras.layers.convolutional import Conv2D
from keras.layers.convolutional import MaxPooling2D
from keras.utils import np_utils
from keras import backend as K
from keras.models import model_from_json
# import pillow as PIL
from PIL import Image
# %%
K.set_image_dim_ordering('th') # tf: TensorFlow, th: Theano
# Fix random seed for reproducibility
np.random.seed(0)
# %% Load & normalize the data
(X_train, y_train), (X_test, y_test) = mnist.load_data()

img_idx = np.random.randint(0, high=X_test.shape[0])
plt.imshow(X_train[img_idx, :, :], cmap=plt.cm.gray_r, interpolation="nearest")
plt.show()
print("The output is {}.".format(y_train[img_idx]))

num_samples_train = np.random.randint(0, high=X_train.shape[0], size=20000)
X_train = X_train[num_samples_train, :, :]
y_train =y_train[num_samples_train]

num_samples_test = np.random.randint(0, high=X_test.shape[0], size=4000)
X_test = X_test[num_samples_test, :, :]
y_test =y_test[num_samples_test]
# Reshape the inputs
X_train = X_train.reshape(X_train.shape[0], 1, 28, 28).astype('float32')
X_test = X_test.reshape(X_test.shape[0], 1, 28, 28).astype('float32')
# Normalize the inputs from 0 - 255 to 0 - 1
X_train = X_train/255
X_test = X_test/255
# One hot encode the outputs
y_train = np_utils.to_categorical(y_train)
y_test = np_utils.to_categorical(y_test)
# Number of classes: 10
num_classes = y_test.shape[1]
# %% Define & build the model
def CNN_model():
    model = Sequential()
    model.add(Conv2D(32, (5,5), input_shape=(1,28,28), activation='relu'))
    model.add(MaxPooling2D(pool_size=(2,2)))
    model.add(Conv2D(16, (3,3), activation='relu'))
    model.add(MaxPooling2D(pool_size=(2,2)))
    model.add(Dropout(0.2))
    model.add(Flatten())
    # Fully connected NN
    model.add(Dense(128, activation='relu'))
    model.add(Dense(50, activation='relu'))
    model.add(Dense(num_classes, activation='softmax'))
    # List of losses: https://keras.io/losses/
    # List of optimizers: https://keras.io/optimizers/
    # List of metrics: https://keras.io/metrics/
    model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])
    return model

my_model = CNN_model()
# %% Fit the model
r = my_model.fit(x=X_train, y=y_train, validation_data=(X_test, y_test), epochs = 5, batch_size=200)

# gives us back a <keras.callbacks.History object at 0x000000000F2BD240>
print("Returned:", r)

# print the available keys
# should see: dict_keys(['val_loss', 'val_acc', 'loss', 'acc'])
print(r.history.keys())

# Losses
plt.subplot(1, 2, 1)
plt.plot(r.history['loss'], label='loss')
plt.plot(r.history['val_loss'], label='val_loss')
plt.legend()
plt.show()

# Accuracies
plt.subplot(1, 2, 2)
plt.plot(r.history['acc'], label='acc')
plt.plot(r.history['val_acc'], label='val_acc')
plt.legend()
plt.show()
# %% Evaluate the model
scores = my_model.evaluate(X_test, y_test, verbose=0)
print("CNN error: {}%".format(100*(1-scores[1])))
# %% Save the synthesized model
model_json = my_model.to_json() # Serialize the model to JSON
with open('Saved_Models/my_model.json', 'w') as json_file:
    json_file.write(model_json)
# Serialize weights to HDF5
my_model.save_weights('Saved_Models/my_weights.h5')
print('Model saved to disk')
# %% Load the model
json_file = open('Saved_Models/my_model.json', 'r')
model_json = json_file.read()
json_file.close()

my_loaded_model = model_from_json(model_json)
my_loaded_model.load_weights('Saved_Models/my_weights.h5')
print('Model loaded from disk')
# %% Test phase
img = Image.open('../../Datasets/To_Test/8.png');
img = img.convert('L')
img = img.resize((28, 28))

array_img = (array(img))/255
in_data = array_img.reshape((1, 1, 28, 28)).astype('float32')

plt.imshow(array_img*255, cmap=plt.cm.gray_r, interpolation="nearest")
plt.show()

y_pred = my_loaded_model.predict(in_data)
_, idx = np.where(y_pred == np.max(y_pred))
print("Result is {}. Probability is {}%.".format(int(idx), 100*y_pred[0, int(idx)]))