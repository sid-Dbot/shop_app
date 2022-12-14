import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/products_providers.dart';
import 'package:shop_app/widgets/badge.dart';
import 'package:shop_app/widgets/product_item.dart';

import '../Models/product.dart';
import 'cartScreen.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool showFavOnly = false;
  @override
  Widget build(BuildContext context) {
    // final productData = Provider.of<Products>(context).items;
    final product = Provider.of<Products>(context);
    final getitems = showFavOnly ? product.favOnly : product.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {});
              if (value == FilterOptions.Favorites) {
                showFavOnly = true;
              } else {
                showFavOnly = false;
              }
            },
            icon: Icon(Icons.more_vert_outlined),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                    child: Text('Favorites.'), value: FilterOptions.Favorites),
                PopupMenuItem(
                  child: Text('Show All.'),
                  value: FilterOptions.All,
                )
              ];
            },
          ),
          Consumer<Cart>(builder: (context, value, child) {
            return Badge(
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return CartScreen();
                    },
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1, 0);
                      const end = Offset.zero;
                      final tween = Tween(begin: begin, end: end);
                      final animations = animation.drive(tween);

                      return SlideTransition(
                        position: animations,
                        child: child,
                      );
                    },
                  ));
                },
              ),
              value: value.itemCount.toString(),
            );
          })
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(7),
        itemCount: getitems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 5 / 4,
          mainAxisSpacing: 7,
          crossAxisSpacing: 7,
        ),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: getitems[index],
            child: ProductItem(),
          );
        },
      ),
    );
  }
}
