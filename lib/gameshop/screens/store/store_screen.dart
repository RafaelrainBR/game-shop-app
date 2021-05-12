import 'package:flutter/material.dart';
import 'package:gameshop/gameshop/screens/store/widgets/order/order_controller.dart';
import 'package:gameshop/gameshop/screens/store/widgets/order/order_widget.dart';
import 'package:gameshop/gameshop/screens/store/widgets/products/products_controller.dart';
import 'package:gameshop/gameshop/screens/store/widgets/products/products_widget.dart';
import 'package:gameshop/gameshop/screens/store/widgets/search/search_controller.dart';
import 'package:gameshop/gameshop/screens/store/widgets/search/search_widget.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final scrollController = ScrollController();

  final orderController = OrderController();
  final searchController = SearchController();
  final productsController = ProductsController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StoreSearchWidget(searchController: searchController),
          _spacer(),
          StoreOrderWidget(controller: orderController),
          _spacer(10),
          ProductListWidget(
            scrollController: scrollController,
            productsController: productsController,
            searchController: searchController,
          ),
          _spacer(),
        ],
      ),
    );
  }

  Widget _spacer([double height = 20]) {
    return SizedBox(height: height);
  }
}
