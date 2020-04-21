def CNN_model():
	mdl = keras.models.Sequential() 
	mdl.add(keras.layers.convolutional.Conv2D(32, (5,5), input_shape=(1,28,28), activation='relu'))
	mdl.add(keras.layers.convolutional.MaxPooling2D(pool_size=(2,2)))
	mdl.add(keras.layers.convolutional.Conv2D(16, (3,3), activation='relu'))
	mdl.add(keras.layers.convolutional.MaxPooling2D(pool_size=(2,2)))
	mdl.add(keras.layers.Dropout(0.2))
	mdl.add(keras.layers.Flatten())
	mdl.add(keras.layers.Dense(128, activation='relu'))
	mdl.add(keras.layers.Dense(50, activation='relu'))
	mdl.add(keras.layers.Dense(25, activation='relu'))
	mdl.add(keras.layers.Dense(num_classes, activation='softmax'))
	mdl.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])
	return mdl

