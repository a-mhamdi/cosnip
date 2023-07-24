# conda activate introML

import tensorflow as tf # tf.__version__ -> '1.14.0'

import matplotlib.pyplot as plt

from tqdm import trange

# tf.reset_default_graph()

from tensorflow.examples.tutorials.mnist import input_data
""" Import MNIST dataset """
mnist = input_data.read_data_sets("MNIST_data/", one_hot=True)

#= Hyperparameter settings
epochs = 10
batch_size = 128
num_examples = mnist.train.num_examples // batch_size

#= Input data
X = tf.placeholder(shape=[None, 784], dtype=tf.float32)
#= 1st FC layer
W1 = tf.get_variable(name="W1", shape=[784, 128], dtype=tf.float32, initializer=tf.random_normal_initializer)
b1 = tf.Variable(tf.zeros([128]))
Z1 = tf.matmul(X, W1) + b1
A1 = tf.nn.relu(Z1)
#= 2nd FC layer
W2 = tf.get_variable(name="W2", shape=[128, 128], dtype=tf.float32, initializer=tf.random_normal_initializer)
b2 = tf.Variable(tf.zeros([128]))
Z2 = tf.matmul(A1, W2) + b2
A2 = tf.nn.relu(Z2)
#= 3rd FC layer
W3 = tf.get_variable(name="W3", shape=[128, 128], dtype=tf.float32, initializer=tf.random_normal_initializer)
b3 = tf.Variable(tf.zeros([128]))
Z3 = tf.matmul(A2, W3) + b3
A3 = tf.nn.relu(Z3)
#= Readout layer
W4 = tf.get_variable(name="W4", shape=[128, 10], dtype=tf.float32, initializer=tf.random_normal_initializer)
b4 = tf.Variable(tf.zeros([10]))
"logit output"
y_ = tf.matmul(A3, W4) + b4
""" The predicted output """
y_hat = tf.nn.softmax( y_ )
#= Actual output
y = tf.placeholder(tf.float32, [None, 10], name='y')

#= Loss function
loss = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits_v2(labels=y, logits=y_))
#= Optimizer
opt = tf.train.AdamOptimizer().minimize(loss)

#= Variable Initializer
init_op = tf.global_variables_initializer()

import random
eg = random.randint(0, len(mnist.test.images))

# Begin a session within a context
with tf.Session() as sess:
	sess.run(init_op)
	# Training
	for _ in trange(epochs):
		for _ in trange(num_examples):
			batch_Xs, batch_ys = mnist.train.next_batch(batch_size)
			sess.run(opt, feed_dict={X: batch_Xs, y: batch_ys})
	# Prediction
	print(sess.run(y_hat, feed_dict={X: mnist.test.images[eg, :].reshape(-1, 784)}))
	
print(tf.keras.backend.eval(tf.math.argmax(mnist.test.labels[eg])))
plt.imshow(mnist.test.images[eg, :].reshape(28, 28), cmap='gray')
plt.axis('off')
plt.show()
	
