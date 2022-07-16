import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:makegivelive/res/components/buttons.dart';
import 'package:makegivelive/res/components/input_field.dart';
import 'package:makegivelive/res/components/toast.dart';
import 'package:makegivelive/res/models/sharedpreferences.dart';
import 'package:makegivelive/res/screens/sign/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/HomeScreen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formNameKey1 = GlobalKey<FormState>();
  final _formNameKey2 = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  Sharedpreferences sharedPreferences = Sharedpreferences();

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
                child: Text('Sign In.',
                    style: Theme.of(context).textTheme.headline1)),
            SizedBox(height: 100),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.2,
              child: inputField1(
                  emailController, _formNameKey1, "Enter Your Email.", context),
            ),
            SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.2,
              child: inputField1(
                  pwController, _formNameKey2, "Enter Your Password.", context),
            ),
            SizedBox(height: 60),
            button1(() {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: emailController.text, password: pwController.text)
                  .onError((error, stackTrace) => toastIt(error.toString()))
                  .then((value) {
                sharedPreferences.prefs.then((value) {
                  value.setBool("loggedIn", true);
                  value.setString("emailLoggedIn", emailController.text);
                });

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeScreen(emailController.text)));
              });
            }, "Sign In", context),
            TextButton(
              onPressed: () {
                //todo: check controllers to validate login
                // after login add to sharedpreferences

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              child: Text(
                'Need an account?',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
