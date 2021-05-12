import 'package:flutter/material.dart';
import 'package:gameshop/gameshop/screens/store/widgets/products/product_widget.dart';
import 'package:gameshop/gameshop/screens/store/widgets/products/products_controller.dart';
import 'package:gameshop/gameshop/screens/store/widgets/search/search_controller.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ProductListWidget extends StatelessWidget {
  final ScrollController scrollController;
  final ProductsController productsController;
  final SearchController searchController;

  const ProductListWidget(
      {Key? key,
      required this.productsController,
      required this.scrollController,
      required this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (context) {
        final list = productsController.state;
        final filtered = searchController.filter(list);

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          controller: scrollController,
          shrinkWrap: true,
          itemCount: filtered.length,
          itemBuilder: (ctx, i) {
            final product = filtered[i];
            return StoreProductWidget(
              product: product,
              onBuyButtonPress: () {
                // TODO: Send product to BasketController
              },
            );
          },
        );
      },
    );
  }
}
