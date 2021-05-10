import 'package:flutter_modular/flutter_modular.dart';
import 'package:gameshop/app/modules/dashboard/dashboard_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: DashboardModule()),
  ];
}
