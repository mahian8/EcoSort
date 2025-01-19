import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'camera_page.dart'; // Import your CameraScreen for taking pictures.
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClassificationPage extends StatefulWidget {
  const ClassificationPage({Key? key}) : super(key: key);

  @override
  State<ClassificationPage> createState() => _ClassificationPageState();
}

class _ClassificationPageState extends State<ClassificationPage> {
  String? _capturedImagePath; // Path of the selected image.
  String? _itemType; // Type of the waste item.
  String? _classificationResult; // Recyclable or Non-Recyclable.
  String? _binColor; // Suggested bin color.

  // Function to open camera and capture image
  Future<void> openCamera(BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    final imagePath = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(camera: firstCamera),
      ),
    );

    if (imagePath != null && imagePath is String) {
      setState(() {
        _capturedImagePath = imagePath; // Save the image path.
      });
      classifyWaste(imagePath); // Classify the waste using AI model.
    }
  }

  // Function to open gallery and select image
  Future<void> openGallery() async {
    final ImagePicker _picker = ImagePicker();

    // Pick an image from the gallery.
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _capturedImagePath = image.path; // Save the selected image path.
      });
      classifyWaste(image.path); // Classify the waste using AI model.
    }
  }

  // Function to send image to AI model
  Future<void> classifyWaste(String imagePath) async {
    try {
      final url = Uri.parse("http://10.0.2.2:5000/classify"); // Example endpoint.

      // Send the image to the AI model using MultipartRequest
      final request = http.MultipartRequest("POST", url);
      request.files.add(await http.MultipartFile.fromPath('image', imagePath));

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final Map<String, dynamic> result = jsonDecode(responseBody);

        setState(() {
          _itemType = result['class'];
          _binColor = result['color'];

          // Set classification result based on item type
          if (_itemType == "organic") {
            _classificationResult = "Non-Recyclable";
          } else {
            _classificationResult = "Recyclable";
          }
        });
      } else {
        setState(() {
          _itemType = "Error";
          _classificationResult = "Failed to classify";
          _binColor = "N/A";
        });
      }
    } catch (e) {
      setState(() {
        _itemType = "Error";
        _classificationResult = "Failed to classify";
        _binColor = "N/A";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Waste Classification')),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Image/Background.jpg"), // Replace with your background.
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.green.withOpacity(0.7),
              BlendMode.multiply,
            ),
          ),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              height: 300,
              width: 350,
              margin: EdgeInsets.only(top: 35),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const Text('Upload or Take a Photo', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(color: Colors.grey.shade300),
                    height: 140,
                    width: 200,
                    child: _capturedImagePath == null
                        ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.cloud_upload,
                            size: 50,
                          ),
                        ),
                        const Text(
                          'Tap to classify waste',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    )
                        : Image.file(
                      File(_capturedImagePath!), // Display the captured image.
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          openCamera(context); // Open the camera.
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          foregroundColor: Colors.white,
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.camera_alt_outlined),
                            SizedBox(width: 10),
                            Text('Camera'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 25),
                      ElevatedButton(
                        onPressed: openGallery, // Open the gallery.
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          foregroundColor: Colors.white,
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.photo_library),
                            SizedBox(width: 10),
                            Text('Gallery'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              height: 300,
              width: 350,
              margin: const EdgeInsets.only(top: 35),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    'Classification Result',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(color: Colors.grey.shade300),
                    height: 80,
                    width: 240,
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        Column(
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              'Item Type',
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              _itemType ?? '',
                              style: const TextStyle(fontSize: 24,color: Colors.orange),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.greenAccent,
                          ),
                          width: 100,
                          height: 50,
                          child: Center(
                            child: Text(
                              _classificationResult ?? '',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(color: Colors.grey.shade300),
                    height: 120,
                    width: 240,
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        const Text(
                          'Color of Rubbish Bin: ',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _binColor ?? '',
                          style: const TextStyle(fontSize: 25,color: Colors.orange),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}