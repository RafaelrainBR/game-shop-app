import 'package:gameshop/app/modules/dashboard/dashboard_page.dart';
import 'package:gameshop/app/modules/dashboard/dashboard_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DashboardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DashboardStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => DashboardPage()),
  ];
}
