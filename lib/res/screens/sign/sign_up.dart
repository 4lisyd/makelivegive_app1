import 'package:flutter/material.dart';
import 'package:makegivelive/res/components/buttons.dart';
import 'package:makegivelive/res/components/input_field.dart';
import 'package:makegivelive/res/components/toast.dart';
import 'package:makegivelive/res/models/sharedpreferences.dart';
import 'package:makegivelive/res/screens/home/HomeScreen.dart';
import 'package:makegivelive/res/screens/sign/sign_in.dart';
import 'package:makegivelive/res/models/firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String iama = "";
  List<String> listOfGroups = [];
  String currentGroup = "";

  FireStore firestore = FireStore();

  Sharedpreferences sharedPreferences = Sharedpreferences();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  final _formNameKey3 = GlobalKey<FormState>();
  final _formNameKey4 = GlobalKey<FormState>();
  final _formNameKey5 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
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
              SizedBox(height: 50),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 1.2,
                child: inputField1(
                    nameController, _formNameKey3, "Enter Your Name.", context),
              ),
              SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 1.2,
                child: inputField1(emailController, _formNameKey4,
                    "Enter Your Email.", context),
              ),
              SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 1.2,
                child: inputField1(pwController, _formNameKey5,
                    "Enter Your Password.", context),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button1(() {
                    setState(() {
                      iama = "Maker";
                    });
                  }, "Maker", context),
                  button1(() {
                    setState(() {
                      iama = "Leader";
                    });
                  }, "Leader", context),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('I am a ... '),
                  Text(iama, style: Theme.of(context).textTheme.headline2),
                ],
              ),
              SizedBox(height: 20),
              if (iama == "Maker")
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Choose your group',
                        style: Theme.of(context).textTheme.bodyText1),
                    SizedBox(width: 20),
                    allGroupsDropdown(),
                  ],
                ),
              if (iama == "Leader")
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Text(
                    "Ask the administrator to make a group for you and make you the leader. If that has already happened proceed to select the group. ",
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.justify,
                  ),
                ),
              if (iama == "Leader") allGroupsDropdown(),
              SizedBox(height: 20),
              button1(() async {
                // print("widget.nameController.text");
                // dynamic xcv = await widget.firestore.getGroups();
                // print(xcv[0].data());
                // print(nameController.text);
                // print(emailController.text);
                // print(pwController.text);
                // print(iama);
                // print(currentGroup);
                if (nameController.text != "" &&
                    emailController.toString().contains("@") &&
                    pwController.text.length > 5 &&
                    iama != "") {
                  if (iama == "Maker" && currentGroup != "") {
                    // todo: add the shared preferences for each user to enable them to come to the
                    // homescreen directly
                    firestore.signUpMaker(nameController.text, currentGroup,
                        emailController.text);
                  }

                  if (iama == "Leader") {
                    // todo: add the shared preferences for each user to enable them to come to the
                    // homescreen directly
                    firestore.signUpLeader(nameController.text, currentGroup,
                        emailController.text);
                  }
                  FirebaseAuth.instance.authStateChanges().listen((User? user) {
                    if (user == null) {
                      print('User is currently signed out!');
                    } else {
                      print('User is signed in!');
                    }
                  });

                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: pwController.text)
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
                } else {
                  toastIt("Make sure you have entered data correctly...");
                }
              }, "Sign Up", context),
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
      ),
    );
    ;
  }

  FutureBuilder<dynamic> allGroupsDropdown() {
    return FutureBuilder(
        future: firestore.getGroups(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // if (snapshot.hasData) {
          //   return Text(
          //       snapshot.data.data()["totalGroups"].toString());
          // }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            List groupsList = snapshot.data.data()["totalGroups"];

            return DropdownButton(
                alignment: Alignment.center,
                items: groupsList
                    .map((e) => DropdownMenuItem(child: Text(e), value: e))
                    .toList(),
                hint: Text(currentGroup.toString()),
                onChanged: (e) {
                  setState(() {
                    currentGroup = e.toString();
                  });
                });
          } else {
            return CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            );
          }
        });
  }
}
