import 'package:flutter/material.dart';

class YourProducts extends StatelessWidget {
  const YourProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Your products',
        textAlign: TextAlign.center,
      )),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 9,
            child: ListTile(),
          );
        },
      ),
    );
  }
}
