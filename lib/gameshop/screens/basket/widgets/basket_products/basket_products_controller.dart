import 'package:gameshop/gameshop/models/basket_entry_model.dart';
import 'package:gameshop/gameshop/models/product_model.dart';
import 'package:rx_notifier/rx_notifier.dart';

class BasketProductsController {
  final _state = Map<int, BasketEntry>().asRx();

  Iterable<BasketEntry> get basketProducts => _state.values;

  void addProduct(Product product, [int amount = 1]) {
    BasketEntry? entry = _state[product.id];
    if (entry == null) entry = BasketEntry(product, 0);

    _state[product.id] = entry..count += amount;
  }

  void setAmount(Product product, int amount) {
    BasketEntry? entry = _state[product.id];
    if (entry == null) return;

    if (amount == 0) {
      _state.remove(product.id);
      return;
    }

    _state[product.id] = entry..count = amount;
  }
}
