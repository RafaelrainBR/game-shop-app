import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:gameshop/gameshop/models/basket_entry_model.dart';
import 'package:gameshop/gameshop/models/product_model.dart';
import 'package:gameshop/gameshop/screens/basket/widgets/basket_products/util/editing_dialog.dart';

class BasketEntryWidget extends StatefulWidget {
  final BasketEntry basketEntry;
  final bool last;
  final Function(Product, int) onAmountSet;

  const BasketEntryWidget({
    Key? key,
    required this.basketEntry,
    this.last = false,
    required this.onAmountSet,
  }) : super(key: key);

  @override
  _BasketEntryWidgetState createState() => _BasketEntryWidgetState();
}

class _BasketEntryWidgetState extends State<BasketEntryWidget> {
  late Product product;

  @override
  Widget build(BuildContext context) {
    this.product = widget.basketEntry.product;

    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    final result = SizedBox(
      height: size.height * 0.13,
      child: Container(
        decoration: _buildBoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildProductImage(context, size),
            SizedBox(width: size.width * 0.03),
            _buildTextInfo(textTheme),
            Spacer(),
            _buildOptionsButton(context),
            SizedBox(width: size.width * 0.025)
          ],
        ),
      ),
    );

    if (!widget.last)
      return Column(
        children: [
          result,
          Divider(color: Colors.blueGrey),
        ],
      );
    else
      return result;
  }

  Widget _buildProductImage(context, Size size) {
    final boxSize = size.width * 0.20;
    return SizedBox(
      height: boxSize,
      width: boxSize,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset("assets/images/${product.image}", fit: BoxFit.fill),
      ),
    );
  }

  Widget _buildTextInfo(TextTheme textTheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${product.name}\n ",
          style: textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Icon(Icons.format_list_numbered_sharp),
            Text(
              "Quantidade: ${widget.basketEntry.count}",
              style: textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.attach_money_sharp),
            Text(
              "Sub-total: R\$${widget.basketEntry.price}",
              style: textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOptionsButton(context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'edit',
          child: Text("Editar"),
        ),
        PopupMenuItem(
          value: 'remove',
          child: Text("Remover"),
        ),
      ],
      onSelected: (value) async {
        switch (value) {
          case 'remove':
            widget.onAmountSet(product, 0);
            break;
          case 'edit':
            {
              final result = await openEditPopup(widget.basketEntry.count);
              if (result != null) {
                widget.onAmountSet(product, result);
              }
              break;
            }
        }
      },
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Colors.white70,
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 2),
          blurRadius: 2.5,
          color: Colors.blueGrey.withOpacity(0.10),
        )
      ],
    );
  }

  Future<int?> openEditPopup(int amount) async {
    final result = await showDialog(
      context: context,
      builder: (context) =>
          EditingDialog<int>(fieldName: "quantidade", initialValue: amount),
    );

    return result;
  }
}
