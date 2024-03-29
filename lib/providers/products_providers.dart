import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/db/db.dart';

import '../Models/product.dart';

class Products with ChangeNotifier {
  Db db = Db();
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
  final String? authToken;
  Products(this.authToken, this._items);
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

  List<Product> savedProducts = [];

  Future<List<Product>> getsavedProducts() async {
    savedProducts = await db.getAll();
    notifyListeners();
    return savedProducts;
  }

  Future<void> getdata() async {
    final url =
        'https://fir-shop-c3476-default-rtdb.firebaseio.com/products.json?auth=$authToken';
    try {
      final response = await http.get(Uri.parse(url));
      final fetchedData = jsonDecode(response.body) as Map<String, dynamic>;
      if (fetchedData == null) {
        return;
      }
      final List<Product> Data = [];

      if (fetchedData == null) {
        return;
      }
      fetchedData.forEach(
        (key, value) => Data.insert(
            0,
            Product(
                id: key,
                title: value['Name'],
                description: value['Description'],
                price: value['Price'],
                imageUrl: value['ImageUrl'],
                isFav: value['favorites'])),
      );
      print(Data);
      _items = Data;

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  void deleteProduct(String id) {
    final url =
        'https://fir-shop-c3476-default-rtdb.firebaseio.com/products/$id.json?auth=$authToken';
    http.delete(Uri.parse(url)).then((value) {
      _items.removeWhere((product) => product.id == id);
    });
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    final url =
        'https://fir-shop-c3476-default-rtdb.firebaseio.com/products.json?auth=$authToken';
    try {
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
            id: jsonDecode(val.body)['name'],
            title: product.title,
            description: product.description,
            price: product.price,
            imageUrl: product.imageUrl));
      });
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product product) async {
    final indexOfProductToUpdate =
        _items.indexWhere((element) => element.id == id);
    var url =
        'https://fir-shop-c3476-default-rtdb.firebaseio.com/products/$id.json?auth=$authToken';

    await http
        .patch(Uri.parse(url),
            body: jsonEncode({
              'Name': product.title,
              'Description': product.description,
              'Price': product.price,
              'ImageUrl': product.imageUrl,
              'favorites': product.isFav,
            }))
        .then((value) {
      _items[indexOfProductToUpdate] = product;
    });
    notifyListeners();
  }
}
