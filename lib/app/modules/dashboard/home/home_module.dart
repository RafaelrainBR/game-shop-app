import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameshop/app/modules/dashboard/home/home_page.dart';
import 'package:gameshop/app/modules/dashboard/home/home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
  ];
}
