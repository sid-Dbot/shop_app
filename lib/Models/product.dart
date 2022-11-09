import 'package:flutter/material.dart';

class Product {
  final String id;
  final String? title;
  final String description;
  final double? price;
  final String imageUrl;
  bool? isFav;

  Product({
    required this.id,
    @required this.title,
    required this.description,
    this.price,
    required this.imageUrl,
    this.isFav,
  });
}
