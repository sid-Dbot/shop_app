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
  bool validity = false;
  bool init = true;
  final _form = GlobalKey<FormState>();
  var _data = Product(
      id: '', title: '', description: '', price: 0, imageUrl: '', isFav: false);

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      final productId = ModalRoute.of(context)!.settings.arguments as String;

      final productToEdit = Provider.of<Products>(context).findbyid(productId);
      _data = Product(
          id: productToEdit.id,
          title: productToEdit.title,
          description: productToEdit.description,
          price: productToEdit.price,
          imageUrl: productToEdit.imageUrl,
          isFav: productToEdit.isFav);

      ItemForm.nameController.text = productToEdit.title;
      ItemForm.descController.text = productToEdit.description;
      ItemForm.priceCtrllr.text = productToEdit.price.toString();
      ItemForm.urlController.text = productToEdit.imageUrl;
    } else {
      init = false;
      ItemForm.descController.clear();
      ItemForm.nameController.clear();
      ItemForm.priceCtrllr.clear();
      ItemForm.urlController.clear();
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _saveform() {
    validity = _form.currentState!.validate();

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
      appBar: AppBar(title: const Text('Add New Product')),
      body: loading
          ? Center(
              child: SizedBox(
              height: 100,
              width: 100,
              child: const LoadingIndicator(
                indicatorType: Indicator.ballScaleMultiple,
                colors: [Colors.deepOrange, Colors.blue, Colors.deepPurple],
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
                      onSaved: (newValue) {
                        _data = Product(
                            id: _data.id,
                            isFav: _data.isFav,
                            title: newValue.toString(),
                            description: _data.description,
                            price: _data.price,
                            imageUrl: _data.imageUrl);
                      },
                      onChanged: (value) {
                        value == ' ';
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Title cannot be blank!';
                        }
                        if (value.length < 5) {
                          return 'Too short!';
                        }
                        return null;
                      },
                      // onFieldSubmitted: (value) {
                      //   _form.currentState!.validate();
                      // },
                      decoration: const InputDecoration(
                        label: Text('Title'),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    TextFormField(
                      controller: ItemForm.descController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        label: Text('Description'),
                      ),
                      // onFieldSubmitted: (value) {
                      //   _form.currentState!.validate();
                      // },
                      textInputAction: TextInputAction.next,
                      onSaved: (newValue) {
                        _data = Product(
                            id: _data.id,
                            isFav: _data.isFav,
                            title: _data.title,
                            description: newValue.toString(),
                            price: _data.price,
                            imageUrl: _data.imageUrl);
                      },
                      validator: (value) {
                        if (value!.length < 10) {
                          return 'Description needs to be longer!';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: ItemForm.priceCtrllr,
                      decoration: const InputDecoration(
                        label: Text('Price'),
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      // onFieldSubmitted: (value) {
                      //   _form.currentState!.validate();
                      // },
                      validator: (value) {
                        if (value!.isEmpty || value == '0') {
                          return 'Must be greater than 0!';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _data = Product(
                            id: _data.id,
                            isFav: _data.isFav,
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
                      onChanged: (value) {
                        setState(() {});
                      },
                      maxLines: 2,
                      decoration: const InputDecoration(
                        label: Text('Image Url'),
                      ),
                      validator: (value) {
                        if (!value!.startsWith('http') &&
                            !value.startsWith('https')) {
                          return 'Invalid url.';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      onSaved: (newValue) {
                        _data = Product(
                            id: _data.id,
                            isFav: _data.isFav,
                            title: _data.title,
                            description: _data.description,
                            price: _data.price,
                            imageUrl: newValue.toString());
                      },
                      keyboardType: TextInputType.url,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox.square(
                            dimension: 150,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(11),
                                child: Center(
                                  child: ItemForm.urlController.text.isEmpty
                                      ? const Text('no image')
                                      : Image.network(
                                          ItemForm.urlController.text,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (!validity) {
                                  _form.currentState!.validate();
                                  return;
                                }
                                setState(() {
                                  loading = true;
                                });
                                if (ModalRoute.of(context)!
                                        .settings
                                        .arguments !=
                                    null) {
                                  Provider.of<Products>(context, listen: false)
                                      .updateProduct(_data.id, _data)
                                      .then((value) {
                                    setState(() {
                                      loading = false;
                                    });
                                  }).then((value) =>
                                          Navigator.of(context).pop());
                                } else {
                                  Provider.of<Products>(context, listen: false)
                                      .addProduct(_data)
                                      .then((_) {
                                    setState(() {
                                      loading = false;
                                    });
                                  }).then(
                                    (value) => Navigator.of(context).pop(),
                                  );
                                }

                                // print(_data);
                              },
                              child: const Text('Submit'))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
