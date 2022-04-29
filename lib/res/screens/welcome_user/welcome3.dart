import 'package:flutter/material.dart';
import 'package:makegivelive/res/components/buttons.dart';
import 'package:makegivelive/res/screens/sign/sign_in.dart';
import 'package:makegivelive/res/screens/sign/sign_up.dart';

class Welcome3 extends StatefulWidget {
  const Welcome3({Key? key}) : super(key: key);

  @override
  State<Welcome3> createState() => _Welcome3State();
}

class _Welcome3State extends State<Welcome3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          button1(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUp()),
            );
          }, "Sign up", context),
        ],
      ),
    );
  }
}
