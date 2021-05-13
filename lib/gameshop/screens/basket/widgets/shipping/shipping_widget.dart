import 'package:flutter/material.dart';
import 'package:gameshop/gameshop/screens/basket/widgets/basket_products/basket_products_controller.dart';
import 'package:gameshop/gameshop/screens/basket/widgets/shipping/shipping_controller.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ShippingWidget extends StatefulWidget {
  final BasketProductsController basketProductsController;

  const ShippingWidget({Key? key, required this.basketProductsController})
      : super(key: key);

  @override
  _ShippingWidgetState createState() => _ShippingWidgetState();
}

class _ShippingWidgetState extends State<ShippingWidget> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        alignment: Alignment.bottomRight,
        child: RxBuilder(
          builder: (ctx) {
            final entries = widget.basketProductsController.basketProducts;

            final subtotal = ShippingController.sumSubTotal(entries);
            final shipCost = ShippingController.calcFrete(entries, subtotal);

            final total = subtotal + shipCost;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Sub-total: $subtotal",
                  style: textTheme.headline6!.copyWith(color: Colors.black),
                ),
                Text(
                  "Frete: $shipCost",
                  style: textTheme.headline6!.copyWith(color: Colors.black),
                ),
                Text(
                  "Total: $total",
                  style: textTheme.headline4!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
