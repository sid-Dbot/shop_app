import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_providers.dart';
import 'package:shop_app/screens/product_details.dart';
import 'package:shop_app/screens/product_overview.dart';

void main(List<String> args) {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.deepOrange[100],
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.blueGrey, accentColor: Colors.amber),
          iconTheme: const IconThemeData(color: Colors.amber, opacity: 1),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetails.routename: (context) => ProductDetails(),
        },
      ),
    );
  }
}
