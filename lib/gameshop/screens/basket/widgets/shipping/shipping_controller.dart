import 'package:gameshop/gameshop/models/basket_entry_model.dart';

class ShippingController {
  static double calcFrete(Iterable<BasketEntry> entries, double subtotal) {
    if (subtotal > 250) return 0;

    var count = 0;
    entries.map((e) => e.count).forEach((number) => count += number);

    return count * 10;
  }

  static double sumSubTotal(Iterable<BasketEntry> entries) {
    var count = 0.0;

    entries.map((e) => e.price).forEach((number) => count += number);

    return count;
  }
}
