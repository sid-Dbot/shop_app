import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_overview.dart';

void main(List<String> args) {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shop'),
        ),
        body: ProductsOverviewScreen(),
      ),
    );
  }
}
