import 'package:flutter/material.dart';
import 'package:igado_front/constants.dart';

class RadioButtonTransform extends StatelessWidget {
  final UserRole role;
  final Function onChange;
  final String title;
  RadioButtonTransform(
      {@required this.role, @required this.onChange, @required this.title});
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.85,
      alignment: Alignment.topLeft,
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text(title),
        leading: Radio(
          activeColor: kBrown1,
          value: UserRole.owner,
          groupValue: role,
          onChanged: onChange,
        ),
      ),
    );
  }
}
