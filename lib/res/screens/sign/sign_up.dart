import 'package:flutter/material.dart';
import 'package:makegivelive/res/components/buttons.dart';
import 'package:makegivelive/res/components/input_field.dart';
import 'package:makegivelive/res/screens/sign/sign_in.dart';

import 'package:provider/provider.dart';
import 'package:makegivelive/res/models/maker.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  Key userNameKey = const Key("sd");
  String iama = "";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 2,
                ),
                child: Text('Sign up.',
                    // ${context.read<Maker>().numtemp}
                    style: Theme.of(context).textTheme.headline1)),
            SizedBox(height: 80),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.2,
              child:
                  inputField1(widget.userNameKey, "Enter Your Name.", context),
            ),
            SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.2,
              child:
                  inputField1(widget.userNameKey, "Enter Your Email.", context),
            ),
            SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.2,
              child: inputField1(
                  widget.userNameKey, "Enter Your Password.", context),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('I am a ... '),
                Text(widget.iama, style: Theme.of(context).textTheme.headline2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                button1(() {
                  setState(() {
                    widget.iama = "Maker";
                  });
                }, "Maker", context),
                button1(() {
                  setState(() {
                    widget.iama = "Leader";
                  });
                }, "Leader", context),
              ],
            ),
            if (widget.iama == "Maker")
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Choose your group',
                      style: Theme.of(context).textTheme.bodyText1),
                  DropdownButton<String>(
                    items: <String>['A', 'B', 'C', 'D'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ],
              ),
            SizedBox(height: 40),
            button1(() {}, "Sign Up", context),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignIn()),
                );
              },
              child: Text('Already signed up?',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
