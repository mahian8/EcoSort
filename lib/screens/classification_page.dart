import 'package:flutter/material.dart';

class ClassificationPage extends StatelessWidget {
  const ClassificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Waste Classification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Upload or Take a Photo to Classify Waste',
                style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Camera'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Gallery'),
            ),
          ],
        ),
      ),
    );
  }
}
