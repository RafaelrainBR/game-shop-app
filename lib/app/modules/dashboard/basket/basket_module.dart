import 'package:flutter_modular/flutter_modular.dart';

import 'basket_page.dart';

class BasketModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => BasketPage()),
  ];
}
