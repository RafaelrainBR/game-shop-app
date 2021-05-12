import 'package:flutter/material.dart';
import 'package:gameshop/gameshop/models/product_model.dart';

class StoreProductWidget extends StatelessWidget {
  final Product product;
  final void Function() onBuyButtonPress;

  const StoreProductWidget(
      {Key? key, required this.product, required this.onBuyButtonPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final primaryColor = Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: _onProductTap,
      child: Container(
        height: size.height * 0.3,
        width: size.width * 0.3,
        decoration: _buildBoxDecoration(primaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildProductImage(context),
            _buildProductInfo(context),
          ],
        ),
      ),
    );
  }

  void _onProductTap() {}

  BoxDecoration _buildBoxDecoration(Color color) {
    return BoxDecoration(
      color: Colors.white54,
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 8),
          blurRadius: 5,
          color: color.withOpacity(0.28),
        )
      ],
    );
  }

  Widget _buildProductImage(context) {
    return Expanded(
      child: Image.asset("assets/images/${product.image}", fit: BoxFit.fill),
    );
  }

  Widget _buildProductInfo(context) {
    final padding = const EdgeInsets.all(8);
    return Padding(
      padding: padding,
      child: Column(
        children: [
          Text(
            "${product.name}",
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Padding(
              padding: padding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "R\$${product.price}",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: onBuyButtonPress,
                    child: Text(
                      "Comprar",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
