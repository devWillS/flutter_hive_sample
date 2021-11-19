import 'package:flutter_hive_sample/models/record_model.dart';
import 'package:flutter_hive_sample/repositories/base_repository.dart';

class RecordRepository extends BaseRepository<RecordModel> {
  RecordRepository() : super('record');
}
