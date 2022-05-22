import 'package:flutter/material.dart';

class HomeHome extends StatefulWidget {
  const HomeHome({Key? key}) : super(key: key);

  @override
  State<HomeHome> createState() => _HomeHomeState();
}

class _HomeHomeState extends State<HomeHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(
          height: 20,
        ),
        curvyRightCard(Center(
          child: Text("sds"),
        )),
      ]),
    );
  }
}

class curvyRightCard extends StatelessWidget {
  curvyRightCard(this.itschild);
  Widget itschild;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 20, bottom: 20, top: 20, right: 0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark.withOpacity(.2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      height: MediaQuery.of(context).size.height / 4,
      child: itschild,
    );
  }
}
