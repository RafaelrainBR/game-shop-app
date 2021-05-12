import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gameshop/gameshop/models/product_model.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ProductsController {
  final state = <Product>[].asRx();

  ProductsController() {
    update();
  }

  Future<void> update() async {
    final bundle = await rootBundle.loadString('assets/products.json');
    List<dynamic> data = json.decode(bundle);

    final result = data.map((json) => Product.fromJson(json)).toList();
    state.addAll(result);
  }

  void dispose() {
    state.dispose();
  }
}
