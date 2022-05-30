import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:makegivelive/res/models/maker.dart';
import 'package:makegivelive/res/models/sharedpreferences.dart';
import 'package:makegivelive/res/screens/home/HomeScreen.dart';
import 'package:makegivelive/res/screens/sign/sign_up.dart';
import 'package:makegivelive/res/screens/welcome.dart';
import 'package:makegivelive/res/theme/style.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Maker()),
      ChangeNotifierProvider(create: (_) => SharedPreferences()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),

      home: SignUp(),
      //todo: add animated splash
      //screen instead
    );
  }
}
