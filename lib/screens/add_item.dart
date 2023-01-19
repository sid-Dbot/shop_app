import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Models/product.dart';
import 'package:shop_app/providers/products_providers.dart';

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
    final post = Provider.of<Products>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Add New Product')),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    var data = Product(
                        id: DateTime.now().toString(),
                        title: nameController.text,
                        description: descController.text,
                        price: double.parse(priceCtrllr.text),
                        imageUrl: urlController.text);
                    // print(data);
                    post.addProduct(data);
                    Navigator.of(context).pop();
                  },
                  child: Text('Submit'))
            ],
          )
        ],
      ),
    );
  }
}
