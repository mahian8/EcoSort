import 'package:flutter/material.dart';

class ResourcesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resources')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Learn about waste management',
                style: TextStyle(fontSize: 24)),
          ),
          Card(
            margin: const EdgeInsets.all(16.0),
            child: ListTile(
              title: const Text('Tips for Sorting Waste'),
              subtitle: const Text(
                  'Learn the basics of waste sorting and make a positive impact on the environment'),
              onTap: () {
                // Link to Article Page
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.all(16.0),
            child: const ListTile(
              title: Text('City Recycling Initiative'),
              subtitle: Text('Learn about local recycling programs'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(16.0),
            child: const ListTile(
              title: Text('Community Composting'),
              subtitle: Text('Join neighborhood composting efforts'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
