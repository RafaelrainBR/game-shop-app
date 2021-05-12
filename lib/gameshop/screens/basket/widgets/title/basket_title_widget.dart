import 'package:flutter/material.dart';

class BasketTitleWidget extends StatelessWidget {
  const BasketTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Carrinho",
        style: Theme.of(context).textTheme.headline4!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
