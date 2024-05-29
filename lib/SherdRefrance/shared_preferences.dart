import 'package:shared_preferences/shared_preferences.dart';

class shared {
  static setData(key, value) async {
    SharedPreferences shard = await SharedPreferences.getInstance();
    shard.setString(key, value);
  }

  static getData(key) async {
    SharedPreferences shard = await SharedPreferences.getInstance();
    return shard.get(key);
  }

  static Clear_Cash()async{
    SharedPreferences shard = await SharedPreferences.getInstance();
    shard.clear();
  }
  static const String key_ID = "id";
  static const String key_Status = "statusRge";
  static const String key_data = "Data";
}
