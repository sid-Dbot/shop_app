import 'package:flutter/cupertino.dart';

import '../Models/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Hammer',
      description: "A tool use to smash things.",
      price: 0.99,
      imageUrl:
          'https://www.shutterstock.com/image-photo/close-orange-iron-hammer-medium-260nw-1937103445.jpg',
    ),
    Product(
        id: 'p2',
        title: 'Fishing Net',
        description: 'Used for fishing. Applicable in large water bodies.',
        price: 2.3,
        imageUrl:
            'https://img.freepik.com/free-photo/fishing-nets_181624-31810.jpg?size=626&ext=jpg'),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findbyid(String id) {
    return items.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    //_items.add(value);
    notifyListeners();
  }
}
