import 'package:dashstories/data/models/panel_model.dart';
import 'package:dashstories/data/models/short_model.dart';
import 'package:dashstories/data/models/user_model.dart';
import 'package:dashstories/domain/services/hive/hive_service.dart';
import 'package:hive/hive.dart';

class ShortHiveService implements HiveServiceInterface<ShortModel> {
  @override
  String get boxname => 'shorts';

  static late Box<ShortModel> _box;

  @override
  Future<void> close() async {
    await _box.close();
  }

  int get length => _box.length;

  List<ShortModel> get values => _box.values.toList();

  @override
  Future<void> deleteDocumentData({required String key}) {
    return _box.delete(key);
  }

  @override
  ShortModel? getDocumentData({required String key}) {
    return _box.get(key);
  }

  @override
  ShortModel? getDocumentDataAt(int index) {
    return _box.getAt(index);
  }

  Future<void> setDocumentList(Iterable<ShortModel> data) async {
    await _box.addAll(data);
  }

  @override
  Future<void> init() async {
    final short = ShortModelAdapter();
    final userDataAdapter = UserDataModelAdapter();
    final panelModelAdapter = PanelModelAdapter();
    final userDataModelAdapter = UserDataModelAdapter();

    if (!Hive.isAdapterRegistered(short.typeId)) {
      Hive.registerAdapter(short);
    }
    if (!Hive.isAdapterRegistered(userDataAdapter.typeId)) {
      Hive.registerAdapter(userDataAdapter);
    }
    if (!Hive.isAdapterRegistered(panelModelAdapter.typeId)) {
      Hive.registerAdapter(panelModelAdapter);
    }
    if (!Hive.isAdapterRegistered(userDataModelAdapter.typeId)) {
      Hive.registerAdapter(userDataModelAdapter);
    }

    if (!Hive.isBoxOpen(boxname)) {
      _box = await Hive.openBox<ShortModel>(boxname);
    }
  }

  @override
  void setDocumentData({required String key, required ShortModel data}) {
    _box.put(key, data);
  }

  @override
  Future<ShortModel> updateDocumentData(
      {required String key, required ShortModel newData}) {
    _box.put(key, newData);
    return Future.value(newData);
  }
}
