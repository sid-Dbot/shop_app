import 'package:flutter/material.dart';

enum titles { Name, Description, UnitPrice, imgURL }

class ItemForm extends StatelessWidget {
  const ItemForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Product')),
      body: ListView.builder(
        itemCount: titles.values.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: titles.values[index].toString(),
                  label: Text('${titles.values[index]}')),
            ),
          );
        },
      ),
    );
  }
}
