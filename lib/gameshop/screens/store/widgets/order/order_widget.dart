import 'package:flutter/material.dart';
import 'package:gameshop/gameshop/screens/store/widgets/order/order_controller.dart';

class StoreOrderWidget extends StatelessWidget {
  final OrderController controller;

  StoreOrderWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Text(
          "Ordenando por: ${controller.orderType.name}",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).primaryColor,
          ),
          child: IconButton(
            iconSize: 20,
            icon: Icon(Icons.sort),
            color: Colors.white,
            onPressed: () {
              // TODO: Adicionar menu de ordenação.
            },
          ),
        ),
      ],
    );
  }
}
