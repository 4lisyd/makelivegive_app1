import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class GroupHome extends StatefulWidget {
  const GroupHome({Key? key}) : super(key: key);

  @override
  State<GroupHome> createState() => _GroupHomeState();
}

class _GroupHomeState extends State<GroupHome> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Group"));
  }
}
