import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:igado_front/constants.dart';

void showAlert(String text, BuildContext context, Function onPress) {
  Alert(
    context: context,
    title: text,
    buttons: [
      DialogButton(
        color: kBrown1,
        child: Text(
          "OK",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        onPressed: onPress != null
            ? onPress
            : () {
                Navigator.pop(context);
              },
        width: 80,
      ),
    ],
  ).show();
}
