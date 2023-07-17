import tensorflow as tf

# tf.reset_default_graph()

x = tf.placeholder(shape=[2, 1], dtype=tf.float32)
W = tf.get_variable(name='W', shape=[2, 2], dtype=tf.float32, initializer=tf.random_normal_initializer)
b = tf.constant([[0],[1]], dtype=tf.float32)

y = tf.add(tf.matmul(W, x), b)

with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    print(sess.run(W))
    print(sess.run(y, feed_dict={x: [[1], [.5]]}))
