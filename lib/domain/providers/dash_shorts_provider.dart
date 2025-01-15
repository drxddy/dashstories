import 'package:dashstories/data/models/models.dart';
import 'package:dashstories/domain/services/hive/hive.dart';
import 'package:flutter/material.dart';

class DashShortsProvider extends ChangeNotifier {
  DashShortsProvider._privateConstructor() {
    final shortsHiveService = ShortHiveService();
    _shorts = shortsHiveService.values;
  }

  static final DashShortsProvider _instance =
      DashShortsProvider._privateConstructor();

  factory DashShortsProvider() {
    return _instance;
  }

  List<ShortModel> _shorts = [];

  List<ShortModel> get shorts => _shorts;

  void addShort(ShortModel short) {
    _shorts.add(short);
    notifyListeners();
  }

  void removeShort(ShortModel short) {
    _shorts.remove(short);
    notifyListeners();
  }

  void updateShort(ShortModel short) {
    final index = _shorts.indexWhere((element) => element == short);
    _shorts[index] = short;
    notifyListeners();
  }

  void clearShorts() {
    _shorts.clear();
    notifyListeners();
  }

  void addAllShorts(List<ShortModel> shorts) {
    _shorts.addAll(shorts);
    notifyListeners();
  }

  void removeAllShorts(List<ShortModel> shorts) {
    _shorts.removeWhere((element) => shorts.contains(element));
    notifyListeners();
  }
}
