import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:makegivelive/res/components/input_field.dart';
import 'package:makegivelive/res/models/currentUser.dart';
import 'package:makegivelive/res/models/firestore.dart';
import 'package:bubble/bubble.dart';
import 'package:provider/provider.dart';

class MessageHome extends StatefulWidget {
  const MessageHome({Key? key}) : super(key: key);

  @override
  State<MessageHome> createState() => _MessageHomeState();
}

class _MessageHomeState extends State<MessageHome> {
  TextEditingController textcontroller = TextEditingController();
  final _formNameKey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text(
              //   "Group Chat Room",
              //   style: Theme.of(context).textTheme.headline2,
              // ),
              StreamBuilder<QuerySnapshot>(
                  stream: FireStore().getGroupChat("The Easterns").asStream(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    // if (snapshot.hasData) {
                    //   return Text(snapshot.data!.docs[0]["message"].toString());
                    // }
                    // return Text(snapshot.data.toString());

                    // print(snapshot.data.data());

                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          // Text(snapshot.data
                          //     .data()["groupChat"][0]["message"]
                          //     .toString()),
                          for (dynamic i in snapshot.data!.docs.toList())
                            if (i["senderRole"] == "leader")
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(i["senderRole"],
                                        textAlign: TextAlign.start),
                                    Bubble(
                                      // margin: BubbleEdges.only(top: 10,),
                                      shadowColor: Colors.blue,
                                      elevation: 2,
                                      alignment: Alignment.topLeft,
                                      nip: BubbleNip.leftTop,
                                      color: Color.fromARGB(255, 225, 255, 199),
                                      child: Text(
                                        i["message"],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            else
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Bubble(
                                      margin: BubbleEdges.only(top: 10),
                                      shadowColor: Colors.blue,
                                      elevation: 2,
                                      alignment: Alignment.topRight,
                                      nip: BubbleNip.rightTop,
                                      child: Text(i["message"]),
                                    ),
                                    Text(i["sender"]),
                                  ],
                                ),
                              )
                        ],
                      );
                    } else {
                      return Center(child: Text(""));
                    }
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: inputField1(textcontroller, _formNameKey3,
                            "Send to Groupchat", context)),
                    IconButton(
                      onPressed: () {
                        print(context.read<CurrentUser>.call().email +
                            context.read<CurrentUser>.call()
                                .currentUser
                                .toString() +
                            context.read<CurrentUser>.call().groupName);
                        print(FireStore().sendMessageInGroup(
                            textcontroller.text,
                            context.read<CurrentUser>.call().email,
                            context.read<CurrentUser>.call().currentUser,
                            context.read<CurrentUser>.call().groupName));
                        setState(() {
                          textcontroller.clear();
                        });
                      },
                      icon: Icon(Icons.send),
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
