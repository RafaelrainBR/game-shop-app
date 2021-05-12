import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameshop/app/modules/dashboard/widgets/navbar_widget.dart';

class DashboardPage extends StatefulWidget {
  final String title;

  const DashboardPage({Key? key, this.title = 'DashboardPage'})
      : super(key: key);

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  final NavBar navBar = Modular.get();
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: RouterOutlet(),
      bottomNavigationBar: navBar,
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
