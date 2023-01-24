import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_providers.dart';

class YourProducts extends StatefulWidget {
  const YourProducts({super.key});

  @override
  State<YourProducts> createState() => _YourProductsState();
}

class _YourProductsState extends State<YourProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Your products',
      )),
      body: Consumer<Products>(builder: (context, value, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: value.items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Card(
                  elevation: 9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox.square(
                            dimension: 100,
                            child: Image.network(
                              value.items[index].imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: 125,
                            child: Text(
                              '${value.items[index].title}',
                              //style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.yellow.shade900,
                                    size: 45,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    value.deleteProduct(value.items[index].id);
                                    setState(() {});
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content:
                                          Text('Item successfully deleted!'),
                                      duration: Duration(seconds: 2),
                                    ));
                                  },
                                  icon: Icon(
                                    Icons.delete_forever,
                                    color: Colors.red.shade900,
                                    size: 45,
                                  )),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
