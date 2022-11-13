import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Models/product.dart';
import 'package:shop_app/screens/product_details.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
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
              icon: Icon((product.isFav == false)
                  ? Icons.favorite_outline
                  : Icons.favorite),
              onPressed: () {},
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
              onPressed: () {
                product.favoritetoggle();
              },
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
