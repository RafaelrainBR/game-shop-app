import 'package:flutter/material.dart';
import 'package:gameshop/gameshop/models/product_model.dart';
import 'package:rx_notifier/rx_notifier.dart';

class SearchController {
  final inputController = TextEditingController();
  var state = RxNotifier("");

  void sendChanged(String text) {
    this.state.value = text;
  }

  List<Product> filter(List<Product> oldList) {
    oldList = List.from(oldList);

    if (state.value.isEmpty) return oldList;

    return oldList
        .where(
          (product) =>
              product.name.toLowerCase().contains(state.value.toLowerCase()),
        )
        .toList();
  }
}
