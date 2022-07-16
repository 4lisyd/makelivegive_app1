import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:makegivelive/res/models/currentUser.dart';
import 'package:makegivelive/res/models/sharedpreferences.dart';
import 'package:makegivelive/res/screens/home/HomeScreen.dart';
import 'package:makegivelive/res/screens/sign/sign_up.dart';
import 'package:makegivelive/res/screens/welcome.dart';
import 'package:makegivelive/res/theme/style.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  // firebase startup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // configure shared preferences
  final prefs = await SharedPreferences.getInstance();
  bool loggedIn;
  String loggedEmail = "";
  if (prefs.getBool("loggedIn") != null) {
    loggedIn = prefs.getBool("loggedIn")!;
  } else {
    loggedIn = false;
  }

  if (prefs.getString("emailLoggedIn") != null) {
    var loggedEmail = prefs.getString("emailLoggedIn")!;
  } else {
    loggedEmail = "";
  }

  runApp(MultiProvider(
    providers: [
      // ChangeNotifierProvider(create: (_) => Maker(),),
      ChangeNotifierProvider(
        create: (_) => CurrentUser(),
      ),

      // ChangeNotifierProvider(create: (_) => SharedPreferences()),
    ],
    child: MyApp(loggedIn, loggedEmail),
  ));
}

class MyApp extends StatefulWidget {
  MyApp(
    this.loggedIn,
    this.loggedEmail,
  );
  bool loggedIn;
  String loggedEmail;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your applic
  // ation.
  @override
  Widget build(BuildContext context) {
    context.read<CurrentUser>().email = widget.loggedEmail;

    return MaterialApp(
      title: 'Make Live Give',
      theme: appTheme(),

      home: widget.loggedIn ? HomeScreen(widget.loggedEmail) : Welcome(),
      //todo: add animated splash
      //screen instead
    );
  }
}
