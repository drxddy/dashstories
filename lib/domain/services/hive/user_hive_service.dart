import 'package:dashstories/data/models/user_model.dart';
import 'package:dashstories/domain/services/hive/hive_service.dart';
import 'package:hive/hive.dart';

class UserDataHiveService implements HiveServiceInterface<UserDataModel> {
  static late Box<UserDataModel> _box;

  @override
  String get boxname => 'user_data';

  @override
  void close() {
    _box.close();
  }

  @override
  Future<void> deleteDocumentData({required String key}) {
    return _box.delete(key);
  }

  @override
  UserDataModel? getDocumentData({required String key}) {
    return _box.get(key);
  }

  @override
  UserDataModel? getDocumentDataAt(int index) {
    return _box.getAt(index);
  }

  @override
  Future<void> init() async {
    final userData = UserDataModelAdapter();
    if (!Hive.isAdapterRegistered(userData.typeId)) {
      Hive.registerAdapter(userData);
    }

    if (!Hive.isBoxOpen(boxname)) {
      _box = await Hive.openBox<UserDataModel>(boxname);
    }
  }

  @override
  void setDocumentData({required String key, required UserDataModel data}) {
    _box.put(key, data);
  }

  @override
  Future<UserDataModel> updateDocumentData(
      {required String key, required UserDataModel newData}) {
    _box.put(key, newData);
    return Future.value(newData);
  }
}
