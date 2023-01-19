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
  var data = {
    'name': nameController.text,
    'desc': descController.text,
    'price': priceCtrllr.text,
    'imgUrl': urlController.text,
  };
  @override
  Widget build(BuildContext context) {
    final post = context.read<Products>();
    final type = Provider.of<Product>(context);
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
                        title: nameController.text,
                        description: descController.text,
                        price: double.parse(priceCtrllr.text),
                        imageUrl: urlController.text);
                    // print(data);
                    post.addProduct(data);
                    Navigator.pop(context);
                  },
                  child: Text('Submit'))
            ],
          )
        ],
      ),
    );
  }
}
