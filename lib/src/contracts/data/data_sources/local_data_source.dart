

import 'package:get/get.dart' show Get, Inst;
import 'package:meta/meta.dart';
import 'package:panda/src/contracts/data/data_sources/data_source.dart';
import 'package:panda/src/services/preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource extends DataSource {
  @protected
  SharedPreferences get preferences =>
      Get.find<PreferencesService>().preferences;
}
