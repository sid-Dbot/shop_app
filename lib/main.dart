import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/screens/add_itemScreen.dart';
import 'package:shop_app/screens/auth_Screen.dart';
import 'package:shop_app/screens/manage_your_productsScreen.dart';
import 'package:shop_app/screens/ordersScreen.dart';

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
          create: (context) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (context) => Products(null, []),
          update: (context, value, previous) =>
              Products(value.token, previous!.items),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrdersList(),
        )
      ],
      child: Consumer<Auth>(
        builder: (context, value, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.blue,
              colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: Colors.blueGrey,
                  accentColor: Colors.deepOrange[800]),
              iconTheme:
                  const IconThemeData(color: Colors.deepOrange, opacity: 1),
              textTheme: const TextTheme(
                subtitle1: TextStyle(fontSize: 25),
                bodyText2: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )),
          home: value.isAuth
              ? ProductsOverviewScreen()
              : const AuthenticationScreen(),
          routes: {
            '/product_details': (context) => ProductDetails(),
            '/orders': (context) => OrdersScreen(),
            '/add_Product': (context) => ItemForm(),
            '/your_Products': (context) => const ManageProductsScreen(),
            '/loginScreen': (context) => const AuthenticationScreen(),
          },
        ),
      ),
    );
  }
}
