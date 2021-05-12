import 'package:flutter/material.dart';
import 'package:gameshop/gameshop/screens/home/widgets/home_appbar_widget.dart';

class HomeScreen extends StatefulWidget {
  final pages = [];

  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final appBar = HomeAppBar();

  @override
  void initState() {
    super.initState();
    appBar.onChange = _updateBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Text("oi"), //widget.pages[appBar.index],
      bottomNavigationBar: appBar,
    );
  }

  void _updateBody(int index) {
    setState(() {
      appBar.index = index;
    });
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
