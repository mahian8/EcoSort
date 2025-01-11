import 'package:flutter/material.dart';

class SortingHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sorting History')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Monthly Summary',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text('127\nItems Sorted',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20)),
              Text('78%\nRecyclable',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20)),
            ],
          ),
          const Divider(height: 20, thickness: 1),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.restore),
                  title: Text('Plastic Bottle'),
                  subtitle: Text('Today, 2:30 PM'),
                  trailing: Text('Recyclable'),
                ),
                ListTile(
                  leading: Icon(Icons.restore),
                  title: Text('Food Waste'),
                  subtitle: Text('Today, 1:15 PM'),
                  trailing: Text('Compost'),
                ),
                ListTile(
                  leading: Icon(Icons.restore),
                  title: Text('Cardboard Box'),
                  subtitle: Text('Yesterday, 2:20 PM'),
                  trailing: Text('Recyclable'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
