import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const ProductItem({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: GridTileBar(
          title: Text(title,
              style: const TextStyle(
                color: Colors.black54,
              ),
              textAlign: TextAlign.end),
        ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
        ));
  }
}