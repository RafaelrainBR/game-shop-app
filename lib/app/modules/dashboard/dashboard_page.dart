import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:gameshop/app/modules/dashboard/dashboard_store.dart';
import 'package:flutter/material.dart';
import 'package:gameshop/app/modules/dashboard/widgets/product_list_widget.dart';
import 'package:gameshop/app/modules/dashboard/widgets/search_widget.dart';
import 'package:gameshop/shared/models/product_model.dart';

class DashboardPage extends StatefulWidget {
  final String title;
  const DashboardPage({Key? key, this.title = 'DashboardPage'})
      : super(key: key);
  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  final DashboardStore store = Modular.get();
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
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
                );
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_sharp), label: "Início"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Carrinho")
        ],
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

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Center(
        child: Text(
          "Game Shop",
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
