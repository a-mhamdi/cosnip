#= HOW TO DESIGN A CNN ARCHITECTURE USING TENSORFLOW =#
""" conda activate introML """

import tensorflow as tf # tf.__version__ -> '1.14.0'
tf.compat.v1.logging.set_verbosity(tf.compat.v1.logging.ERROR)  # {DEBUG, INFO, WARN, ERROR, FATAL}

import matplotlib.pyplot as plt

from tqdm import trange

from tensorflow.examples.tutorials.mnist import input_data
# Import MNIST dataset
mnist = input_data.read_data_sets("MNIST_data/", one_hot=True)

X_test = mnist.test.images.reshape(-1, 28, 28, 1)
y_test = mnist.test.labels

import random
idx = random.randint(0, len(X_test)-1)
sample = X_test[idx, :, :, :].reshape(-1, 28, 28, 1)
label = y_test[idx, :]

# Settings
epochs = 4
batch_size = 256
num_samples = len(mnist.train.images) // batch_size

X = tf.placeholder(shape=[None, 28, 28, 1], dtype=tf.float32) # Input: Images of Handwritten Digits
y = tf.compat.v1.placeholder(shape=[None, 10], dtype=tf.float32) # Output: Corresponding Labels

# 1st conv layer
with tf.name_scope('conv1') as scope:
	W = tf.Variable(tf.truncated_normal([3, 3, 1, 16], stddev=.1), name='W')
	b = tf.Variable(tf.zeros([16]), name='b')
	conv_z = tf.nn.conv2d(X, W, strides=[1, 1], padding='SAME') + b
	conv_a = tf.nn.relu(conv_z)

out_1 = tf.compat.v1.layers.max_pooling2d(conv_a, pool_size=(2, 2), strides=[2, 2])

# 2nd conv layer
with tf.name_scope('conv2') as scope:
    W = tf.Variable(tf.truncated_normal([3, 3, 16, 32], stddev=.1), name='W')
    b = tf.Variable(tf.zeros([32]), name='b')
    conv_z = tf.nn.conv2d(out_1, W, strides=[1, 1], padding='SAME') + b
    conv_a = tf.nn.relu(conv_z)

out_2 = tf.compat.v1.layers.max_pooling2d(conv_a, pool_size=(2, 2), strides=[2, 2])

#= FLATTENED LAYER
fl = tf.compat.v1.layers.flatten(out_2)
dim = fl.get_shape().as_list()[1]

#= 1ST FULLY CONNECTED LAYER
with tf.name_scope('fc1') as scope:
	W = tf.Variable(tf.truncated_normal([dim, 128], stddev=.1), name='W')
	b = tf.Variable(tf.zeros([128]), name='b')
	fc_z = tf.matmul(fl, W) + b
	fc_a = tf.nn.relu(fc_z)

#= 2ND FULLY CONNECTED LAYER
with tf.name_scope('fc2') as scope:
	W = tf.Variable(tf.truncated_normal([128, 128], stddev=.1), name='W')
	b = tf.Variable(tf.zeros([128]), name='b')
	fc_z = tf.matmul(fc_a, W) + b
	fc_a = tf.nn.relu(fc_z)

#= READOUT LAYER
with tf.name_scope('fc3') as scope:
	W = tf.Variable(tf.truncated_normal([128, 10], stddev=.1), name='W')
	b = tf.Variable(tf.zeros([10]), name='b')
	### " PREDICTED LOGIT "
	y_ = tf.matmul(fc_a, W) + b

#= PREDICTED OUTPUT
y_hat = tf.squeeze(tf.nn.softmax( y_ ))

#= LOSS
loss = tf.compat.v1.losses.softmax_cross_entropy(onehot_labels=y, logits=y_)
#= OPTIMIZER
opt = tf.train.AdamOptimizer().minimize(loss)
#= METRIC
accuracy = tf.reduce_mean(tf.cast(tf.equal(tf.round(y_hat), y), tf.float32))

#= INITIALIZATION
init = tf.global_variables_initializer()

with tf.Session() as sess:
	print(3*'\t' + 5*'---' + ' Initialization ' + 5*'---')
	sess.run(init)
	print(3*'\t' + 5*'---' + ' Training ' + 5*'---')
	for _ in range(epochs):
		for _ in trange(num_samples):
			batch_Xs, batch_ys = mnist.train.next_batch(batch_size)
			sess.run(opt, feed_dict={X: batch_Xs.reshape(-1, 28, 28, 1), y: batch_ys})
		print(\
		'Loss is ', sess.run(loss, feed_dict={X: X_test, y: y_test}),\
		'\t',\
		'Accuracy is ', sess.run(accuracy, feed_dict={X: X_test, y: y_test}))
		
	print(3*'\t' + 5*'---' + ' Prediction ' + 5*'---')
	y_true = tf.keras.backend.eval(tf.math.argmax(label))
	y_pred_onehot = sess.run(y_hat, feed_dict={X: sample})
	y_pred = tf.keras.backend.eval(tf.math.argmax(y_pred_onehot))
	print('Truth is ', y_true, ' and prediction is ', y_pred)
	
	print(3*'\t' + 5*'---' + ' Plot an arbitrary sample ' + 5*'---')
	plt.imshow(sample.reshape(28, 28), cmap='gray')
	plt.title('Ground Truth: {} | Prediction: {}'.format(y_true, y_pred))
	plt.axis('off')
	plt.show()

