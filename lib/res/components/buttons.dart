import 'package:flutter/material.dart';

TextButton button1(
    void Function() func, String text, BuildContext contextOutside) {
  return TextButton(
      onPressed: func,
      child: Container(
        width: 150,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Theme.of(contextOutside).primaryColor),
        alignment: Alignment.center,
        child: Text(
          text,
          style: Theme.of(contextOutside).textTheme.bodyText1?.copyWith(
              color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),
        ),
      ));
}
