import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class MyHomeViewModel {
  increment(WidgetRef ref) {
    ref.read(counterProvider.state).state++;
  }
}
