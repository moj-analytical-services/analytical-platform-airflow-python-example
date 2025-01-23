import tensorflow as tf
import time

# Function to create a more complex model
def create_complex_model():
    model = tf.keras.Sequential([
        tf.keras.layers.Conv2D(32, (3, 3), activation='relu', input_shape=(32, 32, 3)),
        tf.keras.layers.MaxPooling2D((2, 2)),
        tf.keras.layers.Conv2D(64, (3, 3), activation='relu'),
        tf.keras.layers.MaxPooling2D((2, 2)),
        tf.keras.layers.Conv2D(64, (3, 3), activation='relu'),
        tf.keras.layers.Flatten(),
        tf.keras.layers.Dense(64, activation='relu'),
        tf.keras.layers.Dense(10, activation='softmax')
    ])
    model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
    return model

# Function to benchmark performance
def benchmark(device):
    with tf.device(device):
        model = create_complex_model()
        (x_train, y_train), _ = tf.keras.datasets.cifar10.load_data()
        x_train = x_train.astype('float32') / 255
        start_time = time.time()
        model.fit(x_train, y_train, epochs=10, batch_size=64, verbose=0)
        end_time = time.time()
        return end_time - start_time

# Benchmark on GPU
print("Benchmarking GPU")
gpu_time = benchmark('/GPU:0')
print(f"GPU training time: {gpu_time:.2f} seconds")

# Benchmark on CPU
print("Benchmarking CPU")
cpu_time = benchmark('/CPU:0')
print(f"CPU training time: {cpu_time:.2f} seconds")