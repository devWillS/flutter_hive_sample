import 'package:flutter_hive_sample/models/record_model.dart';
import 'package:flutter_hive_sample/models/record_model_box.dart';

class RecordRepository {
  /// [recordModelBox] Boxへのアクセサクラス
  RecordRepository({RecordModelBox? recordModelBox}) {
    _recordBox = recordModelBox ?? RecordModelBox();
  }

  late RecordModelBox _recordBox;

  /// レコードの変更を保存
  Future<int> save(RecordModel record) async {
    final box = await _recordBox.box;
    return await box.add(record);
  }

  /// 全件データを取得
  Future<List<RecordModel>> fetchAll() async {
    final box = await _recordBox.box;
    List<RecordModel> list = box.values.cast<RecordModel>().toList();
    return list;
  }

  /// idを指定してレコードを取得
  Future<RecordModel> get(int id) async {
    final box = await _recordBox.box;
    final model = await box.get(id);
    return model;
  }

  /// 全件削除
  Future<void> deleteAll() async {
    final box = await _recordBox.box;
    await box.deleteFromDisk();
    await _recordBox.open();
  }

  /// 1件削除
  Future<void> delete(int id) async {
    final box = await _recordBox.box;
    await box.delete(id);
  }
}
