import 'package:flutter_hive_sample/models/record_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecordModelBox {
  Future<Box> box = Hive.openBox<RecordModel>('record');

  Future<void> open() async {
    Box b = await box;
    if (!b.isOpen) {
      box = Hive.openBox<RecordModel>('record');
    }
  }
}
