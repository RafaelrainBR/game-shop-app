import 'package:flutter/material.dart';
import 'package:gameshop/gameshop/screens/basket/basket_screen.dart';
import 'package:gameshop/gameshop/screens/home/widgets/home_appbar_widget.dart';
import 'package:gameshop/gameshop/screens/store/store_screen.dart';

class HomeScreen extends StatefulWidget {
  final pages = [
    StoreScreen(),
    BasketScreen(),
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final appBar = HomeAppBar();

  @override
  void initState() {
    super.initState();
    appBar.onChange = () => setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: widget.pages[appBar.index],
      bottomNavigationBar: appBar,
    );
  }

  AppBar _buildAppBar(context) {
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
