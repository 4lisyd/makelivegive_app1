import 'package:flutter/material.dart';

class curvyRightCard extends StatelessWidget {
  curvyRightCard(this.itschild);
  Widget itschild;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, bottom: 20, top: 20, right: 0),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 20, bottom: 20, top: 10, right: 0),
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

class aInventoryItem extends StatelessWidget {
  const aInventoryItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.shopping_cart_rounded,
              size: 35,
            ),
            Text(
              "22 required",
            ),
          ],
        ),
        Text("Product Name",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.w800)),
        Text("Product Code", style: Theme.of(context).textTheme.bodyText1),
      ]),
      height: MediaQuery.of(context).size.height / 7,
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
    );
  }
}

class cInventoryItem extends StatelessWidget {
  const cInventoryItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.shopping_cart_rounded,
              size: 35,
            ),
            Text(
              "22 items",
            ),
          ],
        ),
        Text("Product Name",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontWeight: FontWeight.w800)),
        Text("Product Code", style: Theme.of(context).textTheme.bodyText1),
      ]),
      height: MediaQuery.of(context).size.height / 7,
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
    );
  }
}
