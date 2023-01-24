import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/screens/add_item.dart';
import 'package:shop_app/screens/ordersScreen.dart';
import 'package:shop_app/screens/your_products.dart';

import './providers/cart.dart';
import './providers/products_providers.dart';
import './screens/cartScreen.dart';
import './screens/product_details.dart';
import './screens/product_overview.dart';

void main(List<String> args) {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrdersList(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.deepOrange[100],
            colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.blueGrey, accentColor: Colors.amber[800]),
            iconTheme: const IconThemeData(color: Colors.amber, opacity: 1),
            textTheme: TextTheme(
              subtitle1: TextStyle(fontSize: 25),
              bodyText2: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            )),
        home: ProductsOverviewScreen(),
        routes: {
          '/product_details': (context) => ProductDetails(),
          '/orders': (context) => OrdersScreen(),
          '/add_Product': (context) => ItemForm(),
          '/your_Products': (context) => YourProducts(),
        },
      ),
    );
  }
}
