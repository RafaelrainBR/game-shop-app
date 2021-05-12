import 'package:flutter/material.dart';
import 'package:gameshop/gameshop/models/product_model.dart';
import 'package:rx_notifier/rx_notifier.dart';

typedef ProductComparator = int Function(Product, Product);

class OrderController {
  final _state = RxNotifier(OrderType.NAME);

  OrderType get orderType => _state.value;

  void setType(OrderType type) {
    _state.value = type;
  }

  List<Product> sort(List<Product> products) {
    List<Product> clone = List.from(products);
    clone.sort((a, b) => _state.value.compareTo(a, b));
    return clone;
  }
}

class OrderType {
  final String name;
  final ProductComparator compareTo;

  const OrderType(this.name, this.compareTo);

  static const NAME = OrderType("Ordem alfabética", _compareName);
  static const NAME_DESC = OrderType("Alfabética invertida", _compareNameDesc);
  static const PRICE = OrderType("Menor preço", _comparePrice);
  static const PRICE_DESC = OrderType("Maior preço", _comparePriceDesc);
  static const RATE = OrderType("Melhor avaliação", _compareRate);
  static const RATE_DESC = OrderType("Pior avaliação", _compareRateDesc);

  static List<OrderType> get all =>
      [NAME, NAME_DESC, PRICE, PRICE_DESC, RATE, RATE_DESC];

  static int _compareName(Product a, Product b) => a.name.compareTo(b.name);

  static int _comparePrice(Product a, Product b) => a.price.compareTo(b.price);

  static int _compareRate(Product a, Product b) => a.score.compareTo(b.score);

  static int _compareNameDesc(Product a, Product b) => b.name.compareTo(a.name);

  static int _comparePriceDesc(Product a, Product b) =>
      b.price.compareTo(a.price);

  static int _compareRateDesc(Product a, Product b) =>
      b.score.compareTo(a.score);

  PopupMenuItem toPopupMenuItem(context, OrderController controller) {
    var textStyle = Theme.of(context).textTheme.subtitle1!;
    if (controller.orderType == this) {
      textStyle = textStyle.copyWith(fontWeight: FontWeight.bold);
    }
    return PopupMenuItem(
      child: Text(
        this.name,
        style: textStyle,
      ),
      value: this,
    );
  }
}
