import 'package:flutter/material.dart';
import 'package:gameshop/gameshop/screens/basket/widgets/basket_products/basket_products_controller.dart';
import 'package:gameshop/gameshop/screens/basket/widgets/basket_products/basket_products_widget.dart';
import 'package:gameshop/gameshop/screens/basket/widgets/shipping/shipping_widget.dart';
import 'package:gameshop/gameshop/screens/basket/widgets/title/basket_title_widget.dart';

class BasketScreen extends StatefulWidget {
  static final basketProductsController = BasketProductsController();

  const BasketScreen({Key? key}) : super(key: key);

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _spacer(),
        BasketTitleWidget(),
        _spacer(10),
        BasketProductListWidget(
          controller: BasketScreen.basketProductsController,
        ),
        Spacer(),
        ShippingWidget(
            basketProductsController: BasketScreen.basketProductsController),
      ],
    );
  }

  Widget _spacer([double size = 20.0]) {
    return SizedBox(height: size);
  }
}
