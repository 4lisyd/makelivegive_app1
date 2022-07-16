import 'package:flutter/material.dart';
import 'package:makegivelive/res/models/firestore.dart';
import 'package:bubble/bubble.dart';

class MessageHome extends StatefulWidget {
  const MessageHome({Key? key}) : super(key: key);

  @override
  State<MessageHome> createState() => _MessageHomeState();
}

class _MessageHomeState extends State<MessageHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          "Group Chat Room",
          style: Theme.of(context).textTheme.headline2,
        ),
        StreamBuilder(
            stream: FireStore().getGroupChat("The Easterns").asStream(),
            builder: (context, AsyncSnapshot snapshot) {
              print(snapshot.data.data()["groupChat"]);
              return Column(
                children: [
                  // Text(snapshot.data
                  //     .data()["groupChat"][0]["message"]
                  //     .toString()),
                  for (dynamic i in snapshot.data.data()["groupChat"].toList())
                    if (i["senderRole"])
                      Bubble(
                        margin: BubbleEdges.only(top: 10),
                        shadowColor: Colors.blue,
                        elevation: 2,
                        alignment: Alignment.topRight,
                        nip: BubbleNip.rightTop,
                        color: Color.fromARGB(255, 225, 255, 199),
                        child: Text('Hello, World!'),
                      )
                    else
                      Bubble(
                        margin: BubbleEdges.only(top: 10),
                        shadowColor: Colors.blue,
                        elevation: 2,
                        alignment: Alignment.topLeft,
                        nip: BubbleNip.leftTop,
                        child: Text('Hi, developer!'),
                      )
                ],
              );
            }),
      ]),
    );
  }
}
