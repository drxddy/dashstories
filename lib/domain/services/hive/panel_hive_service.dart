import 'package:dashstories/domain/services/hive/hive_service.dart';
import 'package:hive/hive.dart';
import 'package:dashstories/data/models/models.dart';

class PanelHiveService implements HiveServiceInterface<PanelModel> {
  @override
  String get boxname => 'panel';

  static late Box<PanelModel> _box;

  @override
  Future<void> close() async {
    await _box.close();
  }

  @override
  Future<void> deleteDocumentData({required String key}) {
    return _box.delete(key);
  }

  @override
  PanelModel? getDocumentData({required String key}) {
    return _box.get(key);
  }

  @override
  PanelModel? getDocumentDataAt(int index) {
    return _box.getAt(index);
  }

  @override
  Future<void> init() async {
    final panel = PanelModelAdapter();
    final mediaSizeAdapter = MediaSizeAdapter();
    if (!Hive.isAdapterRegistered(panel.typeId)) {
      Hive.registerAdapter(panel);
    }
    if (!Hive.isAdapterRegistered(mediaSizeAdapter.typeId)) {
      Hive.registerAdapter(mediaSizeAdapter);
    }
    if (!Hive.isBoxOpen(boxname)) {
      _box = await Hive.openBox<PanelModel>(boxname);
    }
  }

  @override
  void setDocumentData({required String key, required PanelModel data}) {
    _box.put(key, data);
  }

  @override
  Future<PanelModel> updateDocumentData(
      {required String key, required PanelModel newData}) {
    _box.put(key, newData);
    return Future.value(newData);
  }
}
