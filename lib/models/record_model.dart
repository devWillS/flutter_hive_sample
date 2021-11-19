import 'package:hive_flutter/hive_flutter.dart';

part 'record_model.g.dart';

@HiveType(typeId: 1)
class RecordModel extends HiveObject {
  @HiveField(0)
  DateTime addDate;
  @HiveField(1)
  int number;

  RecordModel(this.addDate, this.number);

  @override
  String toString() {
    return 'RecordModel{addDate: $addDate, number: $number}';
  }
}
