import 'package:flutter/cupertino.dart';

import '../Models/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Hammer',
      description: "A tool that can smash anything.",
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

  //bool showFavoritesOnly = false;

  List<Product> get items {
    // if (showFavoritesOnly) {
    //   return _items.where((e) => e.isFav).toList();
    // }
    return [..._items];
  }

  List<Product> get favOnly {
    return _items.where((element) => element.isFav).toList();
  }

  // void toggleFavoritesOption() {
  //   showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void toggleAllsOption() {
  //   showFavoritesOnly = false;
  //   notifyListeners();
  // }

  Product findbyid(String id) {
    return items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(
      String id, String title, String desc, double price, String imgUrl) {
    _items.add(Product(
        id: id,
        title: title,
        description: desc,
        price: price,
        imageUrl: imgUrl));
    notifyListeners();
  }
}
