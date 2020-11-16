import 'package:flutter/material.dart';
import 'icon_text_form_field.dart';

class VisibilityFormField extends StatelessWidget {
  final bool isVisible;
  final String title;
  final String placeholder;
  final Function onChange;
  final String initialValue;
  VisibilityFormField(
      {@required this.isVisible,
      @required this.title,
      @required this.placeholder,
      @required this.onChange,
      this.initialValue});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: IconTextFormField(
        initialValue: initialValue,
        title: title,
        icon: Icons.add_circle,
        placeholder: placeholder,
        obscureText: false,
        onChange: onChange,
      ),
      visible: isVisible,
    );
  }
}
