import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NavBar extends StatefulWidget {
  NavBar({
    Key? key,
  }) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      currentIndex: index,
      onTap: (index) {
        this.index = index;
        doUpdate();
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: "Início"),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), label: "Carrinho")
      ],
    );
  }

  void doUpdate() {
    setState(() {
      switch (index) {
        case 0:
          Modular.to.navigate('/home');
          break;
        case 1:
          Modular.to.navigate('/basket');
          break;
      }
    });
  }
}
