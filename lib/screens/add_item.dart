import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Models/product.dart';
import 'package:shop_app/providers/products_providers.dart';

class ItemForm extends StatefulWidget {
  static TextEditingController nameController = TextEditingController();
  static TextEditingController descController = TextEditingController();
  static TextEditingController priceCtrllr = TextEditingController();
  static TextEditingController urlController = TextEditingController();

  @override
  State<ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  List titles = ['Name', 'Description', 'Unit Price', 'imgURL'];

  bool loading = false;

  List<TextEditingController> controllers = [
    ItemForm.nameController,
    ItemForm.descController,
    ItemForm.priceCtrllr,
    ItemForm.urlController,
  ];

  @override
  Widget build(BuildContext context) {
    final post = Provider.of<Products>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text('Add New Product')),
      body: loading
          ? Center(
              child: Container(
              height: 100,
              width: 100,
              child: LoadingIndicator(
                indicatorType: Indicator.ballScaleMultiple,
                colors: [Colors.red, Colors.blue, Colors.amber],
                strokeWidth: 4.0,
              ),
            ))
          : ListView(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: titles.length,
                  itemBuilder: (context, index) {
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
                          setState(() {
                            loading = true;
                          });

                          var data = Product(
                              id: DateTime.now().toString(),
                              title: ItemForm.nameController.text,
                              description: ItemForm.descController.text,
                              price: double.parse(ItemForm.priceCtrllr.text),
                              imageUrl: ItemForm.urlController.text);
                          // print(data);

                          Provider.of<Products>(context, listen: false)
                              .addProduct(data)
                              .then((_) {
                            setState(() {
                              loading = false;
                            });
                          }).then(
                            (value) => Navigator.of(context).pop(),
                          );
                        },
                        child: Text('Submit'))
                  ],
                )
              ],
            ),
    );
  }
}
