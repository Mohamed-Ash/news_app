import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences ? sharedPreferences;
  
  static iniT()async{
  sharedPreferences = await SharedPreferences.getInstance();
  }

 static Future <bool> putBoolean({
    required String key,
  required bool value,
})async{
    return await sharedPreferences!.setBool(key, value);
  }

static dynamic getBoolean({
  required String key,
}){
  return sharedPreferences!.getBool(key);
}
}