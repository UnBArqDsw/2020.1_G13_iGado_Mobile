import 'package:igado_front/constants.dart';
import 'package:flutter/material.dart';

class IconTextFormField extends StatelessWidget {
  final String title;
  final String placeholder;
  final IconData icon;
  final bool obscureText;
  final Function onChange;
  final String initialValue;
  IconTextFormField(
      {@required this.title,
      @required this.placeholder,
      @required this.icon,
      @required this.obscureText,
      @required this.onChange,
      this.initialValue});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: kBrown1,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              title,
              style: TextStyle(
                color: kBrown1,
              ),
            ),
          ],
        ),
        TextFormField(
          initialValue: initialValue,
          obscureText: obscureText,
          decoration: kInputFormStyle.copyWith(
            hintText: placeholder,
          ),
          onChanged: onChange,
        ),
        SizedBox(
          height: 5.0,
        ),
      ],
    );
  }
}
