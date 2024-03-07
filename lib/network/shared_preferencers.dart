import 'package:shared_preferences/shared_preferences.dart';

class Save {
  static SharedPreferences? save;

  static init() async {
    save = await SharedPreferences.getInstance();
    // await Save.setStringData('belgiumAPI', '1915e6109adc4f3a8e4e7246b07dd028');
    // await Save.setStringData('egyptAPI', '39c145edf6cb4a608c058a17afe26e60');
    // await Save.setStringData('germanyAPI', 'b9269ed1c6d8495c9fe0b8c701b51c6b');
    // await Save.setStringData(
    //     'netherlandsAPI', '928a12e71c184dc8b8cfb085cb16e7ed');
    // await Save.setStringData('usAPI', 'ffdf74f7a67a456b8d32cb7f6c87a171');
    // await Save.setStringData(
    //     'defaultApiKey', '5167789e4b1745ba9062ab58aa152104');
    //   928a12e71c184dc8b8cfb085cb16e7ed
    //   4188543a7ad646e483364413dc23c4ea
  }

  static Future<bool?> setBoolData(String key, bool value) async {
    return await save?.setBool(key, value);
  }

  static bool? getBoolData(String key) {
    return save?.getBool(key);
  }

  static Future<bool?> setStringData(String key, String value) async {
    return await save?.setString(key, value);
  }

  static String? getStringData(String key) {
    return save?.getString(key);
  }
}
