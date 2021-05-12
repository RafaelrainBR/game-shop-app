import 'package:flutter/material.dart';
import 'package:gameshop/gameshop/models/product_model.dart';
import 'package:gameshop/gameshop/screens/basket/basket_screen.dart';
import 'package:gameshop/gameshop/screens/basket/widgets/basket_products/basket_products_controller.dart';
import 'package:gameshop/gameshop/screens/store/widgets/order/order_controller.dart';
import 'package:gameshop/gameshop/screens/store/widgets/products/child/product_widget.dart';
import 'package:gameshop/gameshop/screens/store/widgets/products/products_controller.dart';
import 'package:gameshop/gameshop/screens/store/widgets/search/search_controller.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ProductListWidget extends StatelessWidget {
  final ScrollController scrollController;
  final ProductsController productsController;
  final SearchController searchController;
  final OrderController orderController;
  final BasketProductsController basketProductsController =
      BasketScreen.basketProductsController;

  ProductListWidget(
      {Key? key,
      required this.productsController,
      required this.scrollController,
      required this.searchController,
      required this.orderController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (context) {
        List<Product> list = List.from(productsController.state);
        list = orderController.sort(list);
        list = searchController.filter(list);

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          controller: scrollController,
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (ctx, i) {
            final product = list[i];
            return StoreProductWidget(
              product: product,
              onBuyButtonPress: () {
                basketProductsController.addProduct(product);
              },
            );
          },
        );
      },
    );
  }
}
