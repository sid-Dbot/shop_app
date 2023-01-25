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
  //List titles = ['Name', 'Description', 'Unit Price', 'imgURL'];

  bool loading = false;
  final _form = GlobalKey<FormFieldState>();
  var _data = Product(
      id: DateTime.now().toString(),
      title: '',
      description: '',
      price: 0,
      imageUrl: '');

  void _saveform() {
    _form.currentState!.save();
  }

  // List<TextEditingController> controllers = [
  //   ItemForm.nameController,
  //   ItemForm.descController,
  //   ItemForm.priceCtrllr,
  //   ItemForm.urlController,
  // ];

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
          : Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: ItemForm.nameController,
                      onFieldSubmitted: (value) {
                        _saveform();
                      },
                      onSaved: (newValue) {
                        _data = Product(
                            id: _data.id,
                            title: newValue.toString(),
                            description: _data.description,
                            price: _data.price,
                            imageUrl: _data.imageUrl);
                      },
                      decoration: InputDecoration(
                        label: Text('Title'),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    TextFormField(
                      controller: ItemForm.descController,
                      onFieldSubmitted: (value) {
                        _saveform();
                      },
                      maxLines: 3,
                      decoration: InputDecoration(
                        label: Text('Description'),
                      ),
                      textInputAction: TextInputAction.next,
                      onSaved: (newValue) {
                        _data = Product(
                            id: _data.id,
                            title: _data.title,
                            description: newValue.toString(),
                            price: _data.price,
                            imageUrl: _data.imageUrl);
                      },
                    ),
                    TextFormField(
                      controller: ItemForm.priceCtrllr,
                      onFieldSubmitted: (value) {
                        _saveform();
                      },
                      decoration: InputDecoration(
                        label: Text('Price'),
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onSaved: (newValue) {
                        _data = Product(
                            id: _data.id,
                            title: _data.title,
                            description: _data.description,
                            price: double.parse(newValue.toString()),
                            imageUrl: _data.imageUrl);
                      },
                    ),
                    TextFormField(
                      controller: ItemForm.urlController,
                      onFieldSubmitted: (value) {
                        _saveform();
                      },
                      maxLines: 2,
                      decoration: InputDecoration(
                        label: Text('Image Url'),
                      ),
                      textInputAction: TextInputAction.next,
                      onSaved: (newValue) {
                        _data = Product(
                            id: _data.id,
                            title: _data.title,
                            description: _data.description,
                            price: _data.price,
                            imageUrl: newValue.toString());
                      },
                      keyboardType: TextInputType.url,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                loading = true;
                              });
                              // _form.currentState!.reset();

                              // print(_data);

                              Provider.of<Products>(context, listen: false)
                                  .addProduct(_data)
                                  .then((_) {
                                    setState(() {
                                      loading = false;
                                    });
                                  })
                                  .then((value) => _form.currentState!.reset())
                                  .then(
                                    (value) => Navigator.of(context).pop(),
                                  );
                            },
                            child: Text('Submit'))
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
