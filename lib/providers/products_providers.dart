import 'package:flutter/cupertino.dart';

import '../Models/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [];
}
