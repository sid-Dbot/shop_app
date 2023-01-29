import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Hammer',
    //   description: "A tool that can smash anything.",
    //   price: 0.99,
    //   imageUrl:
    //       'https://www.shutterstock.com/image-photo/close-orange-iron-hammer-medium-260nw-1937103445.jpg',
    // ),
    // Product(
    //     id: 'p2',
    //     title: 'Net',
    //     description: 'Net used for fishing',
    //     price: 2.3,
    //     imageUrl:
    //         'https://m.media-amazon.com/images/W/WEBP_402378-T1/images/I/71B5V1IUZLL._AC_UL320_.jpg'),
    // Product(
    //     id: 'p3',
    //     title: 'Pen',
    //     description: "Writing Pen",
    //     price: 4.5,
    //     imageUrl:
    //         'https://images.thepencompany.com/3/nodes/810732.jpg?width=600&height=600&strategy=a')
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

  Future<void> getdata() async {
    const url =
        'https://fir-shop-c3476-default-rtdb.firebaseio.com/products.json';

    var response = await http.get(Uri.parse(url));
    final List<Product> fetchedData = [];

    final savedData = (jsonDecode(response.body)) as Map<String, dynamic>;

    savedData.forEach(
      (key, value) => fetchedData.insert(
          0,
          Product(
              id: key,
              title: value['Name'],
              description: value['Description'],
              price: value['Price'],
              imageUrl: value['ImageUrl'],
              isFav: value['favorites'])),
    );
    _items = fetchedData;

    notifyListeners();
  }

  Future<void> deleteProduct(String id) async {
    final url =
        'https://fir-shop-c3476-default-rtdb.firebaseio.com/products/$id.json';
    await http.delete(Uri.parse(url)).then((value) {
      _items.removeWhere((product) => product.id == id);
    });
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    const url =
        'https://fir-shop-c3476-default-rtdb.firebaseio.com/products.json';
    return await http
        .post(
      Uri.parse(url),
      body: json.encode({
        'Name': product.title,
        'Description': product.description,
        'Price': product.price,
        'ImageUrl': product.imageUrl,
        'favorites': product.isFav,
      }),
    )
        .then((val) {
      _items.add(Product(
          id: val.body,
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl));
    });
  }

  Future<void> updateProduct(String id, Product product) async {
    final indexOfProductToUpdate =
        _items.indexWhere((element) => element.id == id);
    const url =
        'https://fir-shop-c3476-default-rtdb.firebaseio.com/products.json';
    _items[indexOfProductToUpdate] = product;
    notifyListeners();
  }
}
