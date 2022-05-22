import 'package:flutter/material.dart';
import 'package:makegivelive/res/components/buttons.dart';
import 'package:makegivelive/res/components/input_field.dart';
import 'package:makegivelive/res/screens/home/HomeScreen.dart';
import 'package:makegivelive/res/screens/sign/sign_in.dart';

import 'package:provider/provider.dart';
import 'package:makegivelive/res/models/maker.dart';
import 'package:makegivelive/res/models/firestore.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String iama = "";
  List<String> listOfGroups = [];
  String currentGroup = "";

  @override
  Widget build(BuildContext context) {
    FireStore firestore = FireStore();

    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController pwController = TextEditingController();

    final _formNameKey3 = GlobalKey<FormState>();
    final _formNameKey4 = GlobalKey<FormState>();
    final _formNameKey5 = GlobalKey<FormState>();

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
              child: inputField1(
                  emailController, _formNameKey4, "Enter Your Email.", context),
            ),
            SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 1.2,
              child: inputField1(
                  pwController, _formNameKey5, "Enter Your Password.", context),
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
                  FutureBuilder(
                      future: firestore.getGroups(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
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
                                  .map((e) => DropdownMenuItem(
                                      child: Text(e), value: e))
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
                      }),
                ],
              ),
            if (iama == "Leader")
              Text(
                  "Creating your own group where you're a leader, also what kind of info is needed to make a new group",
                  style: Theme.of(context).textTheme.bodyText1),
            SizedBox(height: 20),
            button1(() async {
              // print("widget.nameController.text");
              // dynamic xcv = await widget.firestore.getGroups();
              // print(xcv[0].data());
              // print(xcv[0].runtimeType);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
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
    );
    ;
  }
}
