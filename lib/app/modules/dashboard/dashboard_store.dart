import 'package:flutter_triple/flutter_triple.dart';
import 'package:gameshop/shared/models/product_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class DashboardStore extends StreamStore<Exception, List<Product>> {
  DashboardStore() : super([]);

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
