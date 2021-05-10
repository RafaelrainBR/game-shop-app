import 'package:flutter_test/flutter_test.dart';
import 'package:gameshop/app/modules/dashboard/dashboard_store.dart';
 
void main() {
  late DashboardStore store;

  setUpAll(() {
    store = DashboardStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}