import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makegivelive/res/components/buttons.dart';
import 'package:makegivelive/res/models/currentUser.dart';
import 'package:makegivelive/res/models/firestore.dart';
import 'package:makegivelive/res/screens/home/home_group.dart';
import 'package:makegivelive/res/screens/home/home_home.dart';
import 'package:makegivelive/res/screens/home/home_message.dart';
import 'package:makegivelive/res/screens/home/home_news.dart';
import 'package:makegivelive/res/screens/sign/sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/sharedpreferences.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(this.userEmail);
  final String userEmail;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentBottomBarIndex = 2;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    var userInfo =
        FireStore().getCurrentUserWithEmail("444@gmail.com").then((value) {
      // todo: fix this manual string input
      context.read<CurrentUser>().name = value["name"];
      context.read<CurrentUser>().email = value["email"];
      context.read<CurrentUser>().groupName = value["groupName"];
    });
    // firestore.getCurrentUserWithEmail(prefs)

    return Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: Colors.white,
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button1(() {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignIn()));
              }, "Sign out", context),
              button1(() {
                showAboutDialog(context: context);
              }, "About", context),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // fixedColor: Colors.black,
          elevation: 50,
          type: BottomNavigationBarType.shifting,
          currentIndex: currentBottomBarIndex,
          onTap: (index) {
            print(index);
            setState(() {
              currentBottomBarIndex = index;
            });
          },
          unselectedItemColor: Colors.black,
          selectedItemColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.message_rounded), label: "Messages"),
            BottomNavigationBarItem(
                icon: Icon(Icons.group_add_rounded), label: "Group"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_max_rounded), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper_rounded), label: "News"),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: Text("Make Give Live",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2),
          leading: IconButton(
              onPressed: () {
                _key.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu_rounded,
                size: 40,
              )),
          actions: [
            TextButton(
              child: const CircleAvatar(
                child: Icon(Icons.person),
                radius: 25,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SafeArea(
          child: homeSelector(),
        ));
  }

  Widget homeSelector() {
    switch (currentBottomBarIndex) {
      case 0:
        return MessageHome();

      case 1:
        return GroupHome();

      case 2:
        return HomeHome();

      default:
        return NewsHome();
    }
  }
}
