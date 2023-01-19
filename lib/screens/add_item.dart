import 'package:flutter/material.dart';

class ItemForm extends StatelessWidget {
  List titles = ['Name', 'Description', 'Unit Price', 'imgURL'];
  static TextEditingController nameController = TextEditingController();
  static TextEditingController descController = TextEditingController();
  static TextEditingController priceCtrllr = TextEditingController();
  static TextEditingController urlController = TextEditingController();

  List<TextEditingController> controllers = [
    nameController,
    descController,
    priceCtrllr,
    urlController,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Product')),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          final String name;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controllers[index],
              decoration: InputDecoration(
                  hintText:
                      'Enter ${titles[index].toString().toLowerCase()} for Product',
                  label: Text(
                    '${titles[index]}',
                  )),
            ),
          );
        },
      ),
    );
  }
}
