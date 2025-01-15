import 'dart:convert';
import 'dart:io';

import 'package:dashstories/data/data.dart';
import 'package:dashstories/domain/services/kv_storage_base.dart';
import 'package:dashstories/domain/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'hive/hive.dart';

class BootstrapService {
  static bool didInitilize = false;
  static Future<void> start(void Function() onDone) async {
    try {
      await Hive.initFlutter();
      await KeyValueStorageBase.init();

      await ShowHiveService().init();
      await PanelHiveService().init();
      await EpisodeHiveService().init();
      await ShortHiveService().init();

      await loadAndFillHive();
      didInitilize = true;

      onDone();
    } catch (err, st) {
      AppUtils.logError(err, st);
      exitGracefully();
    }
  }

  static void exitGracefully() async {
    didInitilize = false;
    // close the app
    if (Platform.isAndroid) {
      exit(0);
    } else {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }

  static Future<void> loadAndFillHive() async {
    final data = await rootBundle.load('assets/sample.json');

    final jsonString = String.fromCharCodes(data.buffer.asUint8List());
    final List<dynamic> json = jsonDecode(jsonString);

    final shortHiveService = ShortHiveService();

    if (shortHiveService.length > 0) {
      return;
    }

    await shortHiveService
        .setDocumentList(json.map((e) => ShortModel.fromJson(e)));
  }
}
