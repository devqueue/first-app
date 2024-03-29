import 'package:firstapp/common/values/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService{
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();

    return this;
  }

  Future<bool> setString(String key, String value) async{
    return await _prefs.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async{
    return await _prefs.setBool(key, value);
  }

  bool getDeviceFirstOpen(){
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  bool getIsLoggedIn(){
    return _prefs.getBool(AppConstants.STORAGE_USER_TOKEN_KEY) == null
    ? false
    : true;
  }
}