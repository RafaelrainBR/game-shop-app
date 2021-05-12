import 'package:flutter_test/flutter_test.dart';
import 'package:gameshop/app/modules/dashboard/home/home_store.dart';

void main() {
  late HomeStore store;

  setUpAll(() {
    store = HomeStore();
  });

  test('increment count', () async {
    expect(store._state, equals(0));
    store.update(store._state + 1);
    expect(store._state, equals(1));
  });
}
