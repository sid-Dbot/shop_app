import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/products_providers.dart';
import 'package:shop_app/widgets/badge.dart';
import 'package:shop_app/widgets/product_item.dart';

import '../Models/product.dart';
import '../providers/auth.dart';
import 'cartScreen.dart';

enum FilterOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool showFavOnly = false;
  bool dataFetched = false;

  @override
  void initState() {
    //final loadData = Provider.of<Products>(context, listen: false).getdata();
    Future.delayed(
      Duration.zero,
    )
        .then(
            (value) => Provider.of<Products>(context, listen: false).getdata())
        .then((value) => dataFetched = true);

    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //   Provider.of<Auth>(context).stayLoggedIn();
  // }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context);

    final getitems = showFavOnly ? product.favOnly : product.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shop',
        ),
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
            icon: const Icon(Icons.more_vert_outlined),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                    value: FilterOptions.Favorites, child: Text('Favorites.')),
                const PopupMenuItem(
                  value: FilterOptions.All,
                  child: Text('Show All.'),
                )
              ];
            },
          ),
          Consumer<Cart>(builder: (context, value, child) {
            return Badge(
              value: value.itemCount.toString(),
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
            );
          })
        ],
      ),
      body: dataFetched
          ? RefreshIndicator(
              onRefresh: () {
                return Provider.of<Products>(context, listen: false).getdata();
              },
              child: GridView.builder(
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
            )
          : Center(
              child: SizedBox(
                height: 150,
                width: 175,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballTrianglePathColoredFilled,
                  colors: [
                    Colors.indigoAccent,
                    Colors.deepOrange,
                    Colors.deepPurpleAccent.shade700,
                  ],
                ),
              ),
            ),
      drawer: Drawer(
          //backgroundColor: Colors.deepOrange,
          child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black,
              Colors.amber,
              Colors.black,
            ])),
            child: Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 50,
                ),
                const Text(
                  'Welcome!',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () {
              Navigator.of(context).pushNamed('/orders');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Manage Products'),
            onTap: () {
              Navigator.of(context).pushNamed('/your_Products');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
          // GestureDetector(
          //   onTap: (() {
          //     Navigator.of(context).pushNamed('/orders');
          //   }),
          //   child: Card(
          //     elevation: 7,
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Text(
          //         'Orders',
          //         style: TextStyle(fontSize: 25),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      )),
    );
  }
}
