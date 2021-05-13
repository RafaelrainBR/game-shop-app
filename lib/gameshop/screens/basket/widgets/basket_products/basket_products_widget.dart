import 'package:flutter/material.dart';
import 'package:gameshop/gameshop/screens/basket/widgets/basket_products/basket_products_controller.dart';
import 'package:gameshop/gameshop/screens/basket/widgets/basket_products/child/basket_entry_widget.dart';
import 'package:rx_notifier/rx_notifier.dart';

class BasketProductListWidget extends StatelessWidget {
  final BasketProductsController controller;

  const BasketProductListWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          height: size.height * 0.48,
          width: size.width * 0.90,
          child: Container(
            decoration: _buildBoxDecoration(),
            margin: const EdgeInsets.all(4.0),
            child: RxBuilder(
              builder: (ctx) {
                final entries = controller.basketProducts.toList();
                if (entries.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, size: 48),
                        Text(
                          "Parece que seu carrinho está vazio.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline4!,
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  //controller: scrollController,
                  itemCount: entries.length,

                  itemBuilder: (ctx, i) {
                    final entry = entries[i];

                    return BasketEntryWidget(
                      basketEntry: entry,
                      last: i == entries.length - 1,
                      onAmountSet: controller.setAmount,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.blueGrey,
        width: 1.5,
        style: BorderStyle.solid,
      ),
    );
  }
}
