import 'package:flutter/material.dart';
import 'package:makegivelive/res/screens/home/home_group.dart';
import 'package:makegivelive/res/screens/home/home_home.dart';
import 'package:makegivelive/res/screens/home/home_message.dart';
import 'package:makegivelive/res/screens/home/home_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentBottomBarIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onPressed: () {},
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
