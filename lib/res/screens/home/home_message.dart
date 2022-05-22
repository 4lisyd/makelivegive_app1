import 'package:flutter/material.dart';

class MessageHome extends StatefulWidget {
  const MessageHome({Key? key}) : super(key: key);

  @override
  State<MessageHome> createState() => _MessageHomeState();
}

class _MessageHomeState extends State<MessageHome> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Message)"));
  }
}
