
import 'package:panda/src/contracts/domain/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService extends Service {
  SharedPreferences get preferences => _preferences;
  late SharedPreferences _preferences;

  Future<PreferencesService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }
}
