import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Models/product.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/products_providers.dart';
import 'package:shop_app/screens/product_details.dart';

class ProductItem extends StatelessWidget {
  //ProductItem({required this.imgisthere});
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    var imgisthere = product.imageUrl.isEmpty ? false : true;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/product_details', arguments: product.id);
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
                  color: Colors.red[900],
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
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Item added to cart!'),
                      duration: Duration(milliseconds: 350),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          value.removeSingleItem(product.id);
                        },
                      ),
                    ));
                  },
                ),
              ),
              backgroundColor: Colors.black38,
              title: Text(product.title, textAlign: TextAlign.center),
            ),
            child: imgisthere
                ? Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballScaleMultiple,
                        colors: [Colors.red, Colors.blue, Colors.amber],
                        strokeWidth: 4.0,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
