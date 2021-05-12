import 'package:flutter/material.dart';
import 'package:gameshop/gameshop/screens/store/widgets/order/order_controller.dart';
import 'package:rx_notifier/rx_notifier.dart';

class StoreOrderWidget extends StatelessWidget {
  final OrderController controller;

  StoreOrderWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconSize = 40.0;
    return Row(
      children: [
        Spacer(),
        RxBuilder(
          builder: (BuildContext context) {
            return Text(
              "Ordenando por: ${controller.orderType.name}",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            );
          },
        ),
        SizedBox(width: 10),
        ConstrainedBox(
          constraints: _getConstraints(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return OrderType.all
                    .map((type) => type.toPopupMenuItem(context, controller))
                    .toList();
              },
              onSelected: (type) {
                controller.setType(type as OrderType);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor,
                ),
                child: SizedBox(
                  height: iconSize,
                  width: iconSize,
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.sort, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  BoxConstraints _getConstraints(context) {
    final theme = Theme.of(context);
    final VisualDensity effectiveVisualDensity = theme.visualDensity;

    const double _kMinButtonSize = kMinInteractiveDimension;
    final BoxConstraints unadjustedConstraints = BoxConstraints(
      minWidth: _kMinButtonSize,
      minHeight: _kMinButtonSize,
    );

    return effectiveVisualDensity.effectiveConstraints(unadjustedConstraints);
  }
}
