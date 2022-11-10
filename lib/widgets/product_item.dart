import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_details.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetails.routename,arguments: id
            
             ););
      },
      child: GridTile(
          footer = GridTileBar(
            trailing: IconButton(
              iconSize: 20,
              icon: const Icon(
                Icons.favorite_outline,
              ),
              onPressed: () {},
            ),
            leading: IconButton(
              iconSize: 20,
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.black38,
            title: Text(title, textAlign: TextAlign.center),
          ),
          child = Image.network(
            imageUrl,
            fit: BoxFit.fill,
          )),
    );
  }
}
