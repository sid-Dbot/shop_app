import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Models/product.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/products_providers.dart';
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
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 1.5,
                offset: Offset(3, 2),
                spreadRadius: 2,
              ),
            ],
          ),
          child: GridTile(
            footer: GridTileBar(
              trailing: Consumer<Product>(
                builder: (context, value, child) => IconButton(
                  color: Colors.blue[900],
                  icon: Icon(
                      value.isFav ? Icons.favorite : Icons.favorite_outline),
                  onPressed: () {
                    value.favoritetoggle();
                  },
                ),
              ),
              leading: Consumer<Cart>(
                builder: (context, value, child) => IconButton(
                  color: Colors.blue[900],
                  icon: const Icon(
                    Icons.add_shopping_cart_outlined,
                  ),
                  onPressed: () {
                    value.addToCart(product.id, product.price, product.title);
                  },
                ),
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
      ),
    );
  }
}
