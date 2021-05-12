import 'package:gameshop/shared/models/product_model.dart';

class Basket {
  Map<Product, int> products = {};

  int get count => products.length;

  void addProduct(Product product, [int amount = 1]) {
    if (products.containsKey(product)) {
      final count = products[product]!;
      this.products[product] = count + 1;
    } else {
      this.products[product] = amount;
    }
  }
}
