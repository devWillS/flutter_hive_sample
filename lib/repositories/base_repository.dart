import 'package:hive/hive.dart';

class BaseRepository<T> {
  BaseRepository(this.name) {
    _box = Hive.openBox<T>(name);
  }

  final String name;

  late Future<Box> _box;

  Future<void> open() async {
    Box box = await _box;
    if (!box.isOpen) {
      _box = Hive.openBox<T>(name);
    }
  }

  /// レコードの変更を保存
  Future<int> save(T record) async {
    final box = await _box;
    return await box.add(record);
  }

  /// 全件データを取得
  Future<List<T>> fetchAll() async {
    final box = await _box;
    List<T> list = box.values.cast<T>().toList();
    return list;
  }

  /// idを指定してレコードを取得
  Future<T?> get(int id) async {
    final box = await _box;
    final model = box.get(id);
    return model;
  }

  /// 全件削除
  Future<void> deleteAll() async {
    final box = await _box;
    await box.deleteFromDisk();
    await open();
  }

  /// 1件削除
  Future<void> delete(int id) async {
    final box = await _box;
    await box.delete(id);
  }
}
