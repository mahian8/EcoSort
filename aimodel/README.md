# Waste Classifier AI Model

This project provides a TensorFlow Lite model (`waste_classifier_model.tflite`) to classify waste into five categories: **glass**, **metal**, **organic**, **paper**, and **plastic**. The model is trained using MobileNetV2 architecture and is optimized for deployment in lightweight systems such as mobile or web applications.

---

## **Contents**
- `waste_classifier_model.tflite`: The trained TensorFlow Lite model.
- `categories.json`: A file mapping numerical outputs to waste categories.
- `exampleBackend.py`: Backend example for using the AI Model.

---

## **How to Use**

### **1. Model Integration**
The `waste_classifier_model.tflite` can be loaded in any system that supports TensorFlow Lite. Below is an example in Python:

```python
import tensorflow as tf
import numpy as np
from PIL import Image

# Load the TFLite model
interpreter = tf.lite.Interpreter(model_path="waste_classifier_model.tflite")
interpreter.allocate_tensors()

# Get input and output details
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

# Preprocess the image
img = Image.open("test_images/plastic_bottle.jpg").resize((224, 224)) #put your own images here to test
img_array = np.array(img) / 255.0  # Normalize the image
img_array = np.expand_dims(img_array, axis=0)  # Add batch dimension

# Perform inference
interpreter.set_tensor(input_details[0]['index'], img_array)
interpreter.invoke()
predictions = interpreter.get_tensor(output_details[0]['index'])

# Output the predicted class
categories = ["glass", "metal", "organic", "paper", "plastic"]
predicted_class = categories[np.argmax(predictions)]
print(f"Predicted class: {predicted_class}")
