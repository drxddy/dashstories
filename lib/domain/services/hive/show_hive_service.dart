import 'package:dashstories/data/data.dart';
import 'package:dashstories/domain/services/hive/hive_service.dart';
import 'package:hive/hive.dart';

class ShowHiveService implements HiveServiceInterface<ShowModel> {
  static late Box<ShowModel> _box;

  @override
  String get boxname => 'shows';

  @override
  Future<void> init() async {
    final panel = ShowModelAdapter();
    if (!Hive.isAdapterRegistered(panel.typeId)) {
      Hive.registerAdapter(panel);
    }
    if (!Hive.isBoxOpen(boxname)) {
      _box = await Hive.openBox<ShowModel>(boxname);
    }
  }

  int get length => _box.length;

  List<ShowModel> get values => _box.values.toList();

  bool get isEmpty => _box.isEmpty;

  @override
  Future<void> close() async {
    await _box.close();
  }

  @override
  Future<void> deleteDocumentData({required String key}) async {
    await _box.delete(key);
  }

  @override
  ShowModel? getDocumentData({required String key}) {
    return _box.get(key);
  }

  @override
  ShowModel? getDocumentDataAt(int index) {
    try {
      return _box.getAt(index);
    } catch (e) {
      return null;
    }
  }

  @override
  void setDocumentData({required String key, required ShowModel data}) {
    _box.put(key, data);
  }

  @override
  Future<ShowModel> updateDocumentData({
    required String key,
    required ShowModel newData,
  }) async {
    await _box.put(key, newData);
    return newData;
  }
}
