import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreferences with ChangeNotifier {
  final prefs = SharedPreferences.getInstance();
}
