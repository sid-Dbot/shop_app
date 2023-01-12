import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.deepOrange[100],
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.blueGrey, accentColor: Colors.amber[800]),
          iconTheme: const IconThemeData(color: Colors.amber, opacity: 1),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          '/product_details': (context) => ProductDetails(),
        },
      ),
    );
  }
}
