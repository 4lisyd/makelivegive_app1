import 'package:flutter/material.dart';
import 'package:makegivelive/res/components/ui_misc.dart';

class HomeHome extends StatefulWidget {
  const HomeHome({Key? key}) : super(key: key);

  @override
  State<HomeHome> createState() => _HomeHomeState();
}

class _HomeHomeState extends State<HomeHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(children: [
          SizedBox(
            height: 10,
          ),
          curvyRightCard(Center(
            child: Text("sds"),
          )),
          curvyRightCard(Center(
            child: Text("sds"),
          )),
          curvyRightCard(Center(
            child: Text("sds"),
          )),
        ]),
      ),
    );
  }
}
