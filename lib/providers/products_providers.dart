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
        title: 'Net',
        description: 'Net used for fishing',
        price: 2.3,
        imageUrl:
            'https://m.media-amazon.com/images/W/WEBP_402378-T1/images/I/71B5V1IUZLL._AC_UL320_.jpg'),
    Product(
        id: 'p3',
        title: 'Pen',
        description: "Writing Pen",
        price: 4.5,
        imageUrl:
            'https://images.thepencompany.com/3/nodes/810732.jpg?width=600&height=600&strategy=a')
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
