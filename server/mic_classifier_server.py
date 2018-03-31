from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import socket
#import speechpy.feature as speech
import tensorflow as tf
import numpy as np

import random

NUM_FILTERS = 13 # number of features #15
NUM_CHUNKS = (64+62+60) #number of channels
NUM_HIDDEN = 256 # 1024 gave 74.074 and 1.53687
NUM_CLASSES = 3
TRAIN_SET_SIZE = 23
TRAIN_STEPS = 500
TRAIN_ITS = 20
EVALUATE_ONLY = False

#LAYERS = [128, 128]
LAYERS = [128, 128, 128]
DROPOUT = 0#0.02
DROPOUT = 0
REG_STRENGTH = 0#0.0001

random.seed(1234) #1234

MODEL_DIR = "model_nn1"

server_value = 0

def print_message(num):
    msg = "Did you say "
    num = int(num)
    print(num)
    if num == 0:
        msg += "Alligator"
    if num == 1:
        msg += "Baboon"
    if num == 2:
        msg += "Cow"
    msg += "?!?!?!"
    print(msg)

state = 0
speech_arr = []

def add_to_array(data):
    global speech_arr
    start_byte = 0
    #print(len(data))
    while start_byte < len(data):
        val = data[start_byte:(start_byte+4)].hex()
        temp = int(val, 16)
        if temp > 0x7FFFFFFF:
            temp -= 0x100000000
        temp = temp / (2**21)
        speech_arr.append(temp) #convert to decimal string
        start_byte += 4

input_layer = [tf.feature_column.numeric_column("x", shape=[NUM_FILTERS*NUM_CHUNKS])]
#tf_optimizer=tf.train.ProximalAdagradOptimizer(learning_rate=0.1,
#                                          l2_regularization_strength=REG_STRENGTH)
tf_optimizer=tf.train.FtrlOptimizer(learning_rate=0.1,
                                   l2_regularization_strength=REG_STRENGTH)
tf_optimizer=tf.train.AdamOptimizer()
voicerecog_classifier = tf.estimator.DNNClassifier(feature_columns=input_layer,
                                hidden_units=LAYERS,
                                model_dir=MODEL_DIR,
                                        optimizer=tf_optimizer, n_classes=3,
                                dropout=DROPOUT)
##voicerecog_classifier = tf.estimator.LinearClassifier(feature_columns=input_layer,
##                                                        optimizer=tf_optimizer,
##                                                        model_dir=MODEL_DIR,
##                                                        n_classes=3)
##
def classify_data(speech_arr):
    #print(len(speech_arr))
    #vals = [float(x) for x in speech_arr]
    #flat_features = np.array(vals)
    flat_features = np.array(speech_arr)
    #print(flat_features.shape)
    
    # Classify and print
    #print("Creating Classifier...")
    #input_layer = [tf.feature_column.numeric_column("x", shape=[NUM_FILTERS*NUM_CHUNKS])]
    #tf_optimizer=tf.train.ProximalAdagradOptimizer(learning_rate=0.1,
    #                                          l2_regularization_strength=REG_STRENGTH)
##    tf_optimizer=tf.train.FtrlOptimizer(learning_rate=0.1,
##                                       l2_regularization_strength=REG_STRENGTH)
##    tf_optimizer=tf.train.AdamOptimizer()
##    voicerecog_classifier = tf.estimator.DNNClassifier(feature_columns=input_layer,
##                                    hidden_units=LAYERS,
##                                    model_dir=MODEL_DIR,
##                                            optimizer=tf_optimizer, n_classes=3,
##                                    dropout=DROPOUT)

    data = np.array([flat_features,])
    eval_input_fn = tf.estimator.inputs.numpy_input_fn(
              x={"x": data},
              num_epochs=1,
              shuffle=False)
    eval_results = voicerecog_classifier.predict(input_fn=eval_input_fn)
    for val in eval_results:
        print(val['logits'])
        print(val['probabilities'])
        print_message(val['classes'])
        global server_value
        server_value = int(val['classes'])
        #print("server_value:", server_value)

def get_file_data(f_name):
    with open(f_name, 'r') as f:
        line = f.readline()
        split_line = line.split(',')
        data = []
        for val in split_line[1:]:
            data.append(int(val))
        return data

def get_image(val):
    val = int(val)
    if (val == 0): #alligator
        return get_file_data("images/alligator.csv")
        return [x % 256 for x in range(12288)]
    if (val == 1): #baboon
        return get_file_data("images/baboon.csv")
        return [(x+43) % 256 for x in range(12288)]
    if (val == 2): #cow
        return get_file_data("images/cow.csv")
        return [(x+86) % 256 for x in range(12288)]
    print("Bad val:", val)
    raise ValueError

def send_image(conn, img):
    print("Sending Image...")
    img_bytes = bytes(img)
    print("Sending", len(img_bytes), "bytes", flush=True)
    conn.send(img_bytes)
    conn.send(bytes([1]))
    #for val in img:
    #    conn.send((val).to_bytes(1, 'big'))
    

DATA_SIZE = 4 #number of bytes

PORT = 7
BUFFER_SIZE = 108 #16384 + 4
NUM_SERVER_CHUNKS = 15
#P_MAX = 100
SERVER_VALUE = bytes.fromhex('D15EA5ED')

state = 0

import time

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
    # Allow re-binding the same port
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    # Bind to port on any interface
    sock.bind(('192.168.1.109', PORT))
    sock.listen(1) # allow backlog of 1

    print("BEGIN LISTENING ON PORT", PORT)
    phase = 1
    # Begin listening for connections
    while (True):
        conn, addr = sock.accept()
        print("Accepted Socket")
        with conn:
            print("\nCONNECTION:", addr)
            was_get = False
            for x in range(NUM_SERVER_CHUNKS):
                # Receive and handle command
                data = conn.recv(BUFFER_SIZE)
                if len(data) == BUFFER_SIZE or (len(data) > 4 and data[:4] == b'POST'):
                    if (x == NUM_SERVER_CHUNKS-1):
                        data = data[:-8]
                    add_to_array(data)
                    #print(str(x))
                    #print("Received Data of size", len(data))
                    #print("POST VALUE:", "Len:", len(data), "\n", data.hex(), "\n", data, "\n")
                elif data == b'GET':
                    print("Got GET", flush=True)
                    was_get = True
                    #print_message(server_value)
                    img = get_image(server_value)
                    send_image(conn, img)
                    break
                    #print("GET", SERVER_VALUE.hex(), SERVER_VALUE)
                else:
                    print(len(data), data.hex(), data)
                    print("BAD COMMAND RECEIVED")
            if not was_get:
                if state == 5:
                    state = 0
                    if len(speech_arr) == 2418:
                        classify_data(speech_arr)
                    speech_arr = []
                else:
                    state += 1
            print("state:", state)    
            conn.shutdown(socket.SHUT_RDWR)
            conn.close()


