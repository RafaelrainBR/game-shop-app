import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  Function onChange = () {};
  int index = 0;

  HomeAppBar({Key? key}) : super(key: key);

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      currentIndex: widget.index,
      onTap: (i) {
        widget.index = i;
        widget.onChange();
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_sharp),
          label: "Início",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "Carrinho",
        )
      ],
    );
  }
}
