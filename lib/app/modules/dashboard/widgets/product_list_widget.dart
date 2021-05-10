import 'package:flutter/material.dart';
import 'package:gameshop/app/modules/dashboard/widgets/product_widget.dart';
import 'package:gameshop/shared/models/product_model.dart';

class ProductListRow extends StatelessWidget {
  final Size size;
  final ScrollController scrollController;
  final List<Product> products;

  const ProductListRow(
      {Key? key,
      required this.size,
      required this.scrollController,
      required this.products})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        controller: scrollController,
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductWidget(size: size, product: product);
        },
      ),
    );
  }
}
