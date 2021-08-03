import 'package:flutter_sqllite_table_view/config/values.dart';
import 'package:flutter/material.dart';


class Toast {
  Toast._();
  static buildErrorSnackBar( String message) {
    var showSnackBar = ScaffoldMessenger.of(Values.navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text("$message"),
      ),
    );
  }

  static buildLoadingSnackBar(String message) {

    var showSnackBar = ScaffoldMessenger.of(Values.navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        duration: Duration(minutes: 1),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("$message",),
            SizedBox(width: 30,),
            CircularProgressIndicator(color: Colors.blue,)
          ],
        ),
      ),
    );
  }

  static hidCurrentSnackBar() {
    ScaffoldMessenger.of(Values.navigatorKey.currentContext!).hideCurrentSnackBar();
  }
}