class OrderController {
  var orderType = OrderType.NAME;
// TODO: botar RxNotifier e função pra dar update.
}

class OrderType {
  final String name;

  const OrderType(this.name);

  static const NAME = OrderType("Ordem alfabética");
  static const NAME_DESC = OrderType("Alfabética invertida");
  static const PRICE = OrderType("Menor preço");
  static const PRICE_DESC = OrderType("Maior preço");
  static const RATE = OrderType("Melhor avaliação");
  static const RATE_DESC = OrderType("Pior avaliação");
}
