import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

dynamic toastIt(String string) {
  return Fluttertoast.showToast(
      msg: string,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black38,
      textColor: Colors.white,
      fontSize: 14.0);
}
