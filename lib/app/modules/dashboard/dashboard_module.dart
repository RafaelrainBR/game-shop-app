import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameshop/app/modules/dashboard/basket/basket_module.dart';
import 'package:gameshop/app/modules/dashboard/dashboard_page.dart';
import 'package:gameshop/app/modules/dashboard/home/home_module.dart';
import 'package:gameshop/app/modules/dashboard/widgets/navbar_widget.dart';

import 'basket/basket_store.dart';

class DashboardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => NavBar()),
    Bind.lazySingleton((i) => BasketStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => DashboardPage(), children: [
      ModuleRoute('/home', module: HomeModule()),
      ModuleRoute('/basket', module: BasketModule()),
    ]),
  ];
}
