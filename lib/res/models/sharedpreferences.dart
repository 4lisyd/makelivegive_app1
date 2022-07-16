import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreferences with ChangeNotifier {
  final prefs = SharedPreferences.getInstance();
}



  // value.setBool("loggedIn", true);
  //                 value.setString("emailLoggedIn", emailController.text);