import 'package:flutter_triple/flutter_triple.dart';
import 'package:gameshop/gameshop/models/product_model.dart';

import 'obj/basket_object.dart';

class BasketStore extends NotifierStore<Exception, Basket> {
  BasketStore() : super(Basket());

  Future<void> addProduct(Product product, [int amount = 1]) async {
    setLoading(true);

    this.update(state..addProduct(product, amount), force: true);

    setLoading(false);
  }
}
