import 'package:gameshop/gameshop/models/product_model.dart';

class BasketEntry {
  final Product product;
  int count;

  BasketEntry(this.product, this.count);

  double get price {
    final result = product.price * count;
    return double.parse(result.toStringAsFixed(2));
  }
}
