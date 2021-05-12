import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:gameshop/shared/models/product_model.dart';

class HomeStore extends StreamStore<Exception, List<Product>> {
  HomeStore() : super([]);

  Future<List<Product>> selectAll() async {
    setLoading(true);
    final bundle = await rootBundle.loadString('assets/products.json');
    List<dynamic> data = json.decode(bundle);

    final result = data.map((json) => Product.fromJson(json)).toList();
    update(result);

    setLoading(false);
    return result;
  }
}