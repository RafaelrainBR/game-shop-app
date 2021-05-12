import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameshop/app/modules/dashboard/basket/basket_store.dart';
import 'package:gameshop/app/modules/dashboard/home/home_store.dart';
import 'package:gameshop/app/modules/dashboard/home/widgets/product_list_widget.dart';
import 'package:gameshop/app/modules/dashboard/home/widgets/search_widget.dart';
import 'package:gameshop/shared/models/product_model.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();
  final BasketStore basketStore = Modular.get();
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SearchWidget(size: size),
            SizedBox(height: 20),
            buildOrderbyButton(),
            SizedBox(height: 10),
            FutureBuilder(
              future: store.selectAll(),
              builder: (ctx, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                final result = snapshot.data as List<Product>;

                return ProductListRow(
                  size: size,
                  scrollController: scrollController,
                  products: result,
                  basketStore: basketStore,
                );
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Row buildOrderbyButton() {
    return Row(
      children: [
        Spacer(),
        Text(
          "Ordenando por: Preço",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        Container(
          margin: EdgeInsets.only(right: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).primaryColor,
          ),
          child: IconButton(
            iconSize: 20,
            icon: Icon(Icons.sort),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
