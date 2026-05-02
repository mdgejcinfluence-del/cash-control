
import 'package:shared_preferences/shared_preferences.dart';

class PinService {

  static Future<bool> hasPin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('pin');
  }

  static Future<void> savePin(String pin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('pin', pin);
  }

  static Future<String?> getPin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('pin');
  }

  static Future<bool> checkPin(String pin) async {
    final savedPin = await getPin();
    return savedPin == pin;
  }

  static Future<void> clearPin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('pin');
  }
}
