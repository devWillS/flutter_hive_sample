import 'dart:math';

import 'package:flutter_hive_sample/models/record_model.dart';
import 'package:flutter_hive_sample/repositories/record_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final recordListProvider = StateProvider.autoDispose((ref) => <RecordModel>[]);

class MyHomeViewModel {
  MyHomeViewModel(this.ref);

  final repository = RecordRepository();
  final WidgetRef ref;

  increment() async {
    final record = RecordModel(DateTime.now(), Random().nextInt(10) + 1);
    await repository.save(record);
    getAll();
  }

  getAll() async {
    ref.read(recordListProvider.state).state = await repository.fetchAll();
  }

  delete(RecordModel record) async {
    await repository.delete(record.key);
    await getAll();
  }
}
