import 'package:flutter_test/flutter_test.dart';
import 'package:gameshop/app/modules/dashboard/dashboard_store.dart';
 
void main() {
  late DashboardStore store;

  setUpAll(() {
    store = DashboardStore();
  });

  test('increment count', () async {
    expect(store._state, equals(0));
    store.update(store._state + 1);
    expect(store._state, equals(1));
  });
}