import 'package:dashstories/data/models/episode_model.dart';
import 'package:dashstories/domain/services/hive/hive_service.dart';
import 'package:hive/hive.dart';

class EpisodeHiveService implements HiveServiceInterface<EpisodeModel> {
  @override
  String get boxname => 'episodes';

  late Box<EpisodeModel> _box;

  @override
  Future<void> init() async {
    final episode = EpisodeModelAdapter();
    if (!Hive.isAdapterRegistered(episode.typeId)) {
      Hive.registerAdapter(episode);
    }

    if (!Hive.isBoxOpen(boxname)) {
      _box = await Hive.openBox<EpisodeModel>(boxname);
    }
  }

  @override
  Future<void> close() async {
    await _box.close();
  }

  @override
  Future<void> deleteDocumentData({required String key}) {
    return _box.delete(key);
  }

  @override
  EpisodeModel? getDocumentData({required String key}) {
    return _box.get(key);
  }

  @override
  EpisodeModel? getDocumentDataAt(int index) {
    return _box.getAt(index);
  }

  @override
  void setDocumentData({required String key, required EpisodeModel data}) {
    _box.put(key, data);
  }

  @override
  Future<EpisodeModel> updateDocumentData(
      {required String key, required EpisodeModel newData}) async {
    await _box.put(key, newData);
    return newData;
  }
}
