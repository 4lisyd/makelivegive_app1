import 'package:flutter/material.dart';
import 'package:makegivelive/res/screens/welcome_user/welcome1.dart';
import 'package:makegivelive/res/screens/welcome_user/welcome2.dart';
import 'package:makegivelive/res/screens/welcome_user/welcome3.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: PageView(
        children: [
          Welcome1(),
          Welcome2(),
          Welcome3(),
        ],
      ),
    );
  }
}
