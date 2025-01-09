import 'package:flutter/material.dart';

class ClassificationPage extends StatelessWidget {
  const ClassificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classification'),
      ),
      body: Center(
        child: const Text('Classification Page Content'),
      ),
    );
  }
}
