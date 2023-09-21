import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFav;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFav = false,
  });
  void favoritetoggle() {
    isFav = !isFav;
    notifyListeners();
  }

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      imageUrl: map['imageUrl'],
      isFav: map['isFav'] ?? false,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      "description": description,
      'price': price,
      'imageUrl': imageUrl,
      'isFav': isFav,
    };
  }
}
