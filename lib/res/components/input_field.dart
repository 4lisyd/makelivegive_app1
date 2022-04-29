import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextFormField inputField1(
    formKey, String textString, BuildContext contextOutside) {
  return TextFormField(
    style: TextStyle(color: Theme.of(contextOutside).primaryColorDark),
    cursorColor: Theme.of(contextOutside).primaryColor,
    key: formKey,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Theme.of(contextOutside).primaryColor, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      border: OutlineInputBorder(
        borderSide:
            BorderSide(color: Theme.of(contextOutside).primaryColor, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      labelText: textString,
      labelStyle: Theme.of(contextOutside).textTheme.bodyText1,
      fillColor: Theme.of(contextOutside).primaryColor,
    ),
  );
}
