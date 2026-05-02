
import 'package:hive_flutter/hive_flutter.dart';

class StorageService {

  static late Box box;

  static Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox('cashcontrol');
  }

  static void save(String key, dynamic value) {
    box.put(key, value);
  }

  static dynamic get(String key) {
    return box.get(key);
  }

}
