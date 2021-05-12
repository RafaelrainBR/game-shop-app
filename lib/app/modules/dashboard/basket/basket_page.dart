import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:gameshop/app/modules/dashboard/basket/obj/basket_object.dart';
import 'package:gameshop/app/modules/dashboard/widgets/navbar_widget.dart';

import 'basket_store.dart';

class BasketPage extends StatefulWidget {
  final String title;

  const BasketPage({Key? key, this.title = 'BasketPage'}) : super(key: key);

  @override
  BasketPageState createState() => BasketPageState();
}

class BasketPageState extends State<BasketPage> {
  final NavBar navBar = Modular.get();
  final BasketStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TripleBuilder<BasketStore, Exception, Basket>(
        store: store,
        builder: (context, triple) {
          if (triple.isLoading) return CircularProgressIndicator();
          if (triple.error != null) throw triple.error!;

          final basket = triple.state;

          return ListView.builder(
            itemCount: basket.count,
            itemBuilder: (context, index) {
              final entry = basket.products.entries.toList()[index]!;
              final product = entry.key;
              final count = entry.value;

              return Card(
                child: ListTile(
                  leading: Image.asset('assets/images/${product.image}'),
                  title: Text("${product.name}"),
                  subtitle: Text("Count: ${count}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
