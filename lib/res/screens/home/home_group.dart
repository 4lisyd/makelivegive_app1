import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:makegivelive/res/components/buttons.dart';
import 'package:makegivelive/res/components/ui_misc.dart';
import 'package:makegivelive/res/models/currentUser.dart';
import 'package:makegivelive/res/models/firestore.dart';
import 'package:makegivelive/res/models/sharedpreferences.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupHome extends StatefulWidget {
  const GroupHome({Key? key}) : super(key: key);

  @override
  State<GroupHome> createState() => _GroupHomeState();
}

class _GroupHomeState extends State<GroupHome> {
  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////
    ///
    ///
    ///
    ///stuck here, the problem is that it is not waiting for await hence the list of members do not get filled at all.

    return SingleChildScrollView(
      child: Center(
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 80,
            child: Text(context.watch<CurrentUser>().groupName,
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.left),
          ),
          curvyRightCard(Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Members",
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FutureBuilder(
                  // todo:// fix the group members manually given
                  future: FireStore()
                      .getGroupMembers(context.watch<CurrentUser>().groupName),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        children: [
                          for (String i in snapshot.data.data()['members'])
                            memberAvatar(i)
                        ],
                      );
                    } else {
                      return Row();
                    }
                  },
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    button2(() {}, "Requests", context),
                    button2(() {}, "Invite Members", context),
                  ],
                ),
              ),
            ],
          )),
          curvyRightCard(Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Current Inventory",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      cInventoryItem(),
                      SizedBox(width: 10),
                      cInventoryItem(),
                      SizedBox(width: 10),
                      cInventoryItem(),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ],
            ),
          )),
          curvyRightCard(
            Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Anticipated Inventory",
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          aInventoryItem(),
                          SizedBox(width: 10),
                          aInventoryItem(),
                          SizedBox(width: 10),
                          aInventoryItem(),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}

class memberAvatar extends StatelessWidget {
  memberAvatar(this.name);

  String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            CircleAvatar(
              minRadius: MediaQuery.of(context).size.width / 12,
              child: Icon(
                Icons.person,
              ),
            ),
            SizedBox(height: 5),
            Text(
              name.substring(0, name.indexOf("@")),
              style: Theme.of(context).textTheme.bodyText1?.copyWith(),
            ),
          ],
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
