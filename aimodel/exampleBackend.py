import tensorflow as tf
import numpy as np
import json
from PIL import Image

# Load the class labels
with open("class_labels.json", "r") as f:
    class_labels = json.load(f)

# Load the TFLite model
interpreter = tf.lite.Interpreter(model_path="waste_classifier_model.tflite")
interpreter.allocate_tensors()

# Get input and output details
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

# Preprocess the image
def preprocess_image(image_path):
    img = Image.open(image_path).resize((224, 224))
    img_array = np.array(img) / 255.0
    img_array = np.expand_dims(img_array, axis=0)
    return img_array

# Perform inference
def classify_image(image_path):
    input_data = preprocess_image(image_path)
    interpreter.set_tensor(input_details[0]['index'], input_data)
    interpreter.invoke()
    predictions = interpreter.get_tensor(output_details[0]['index'])
    predicted_class = class_labels[np.argmax(predictions)]
    return predicted_class

# Test with an image
image_path = "test_images/plastic_bottle.jpg"  # Replace with a test image path
result = classify_image(image_path)
print(f"Predicted class: {result}")
