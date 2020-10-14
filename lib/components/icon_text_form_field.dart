import 'package:igado_front/constants.dart';
import 'package:flutter/material.dart';

class IconTextFormField extends StatelessWidget {
  final String title;
  final String placeholder;
  final IconData icon;
  final bool obscureText;
  IconTextFormField(
      {@required this.title,
      @required this.placeholder,
      @required this.icon,
      @required this.obscureText});
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
          obscureText: obscureText,
          decoration: kInputFormStyle.copyWith(
            hintText: placeholder,
          ),
        ),
      ],
    );
  }
}
