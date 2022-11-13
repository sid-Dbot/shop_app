import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/product_details.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // const ProductItem({
  //   required this.id,
  //   required this.title,
  //   required this.imageUrl,
  // });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetails.routename, arguments: product.id);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: GridTileBar(
            trailing: IconButton(
              iconSize: 20,
              icon: Icon((product.isFav == false)
                  ? Icons.favorite_outline
                  : Icons.favorite),
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
            title: Text(product.title, textAlign: TextAlign.center),
          ),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
