import 'package:flutter/material.dart';
import 'package:igado_front/constants.dart';

class DropdownIconText extends StatefulWidget {
  final String dropdownValue;
  final List<String> values;
  final Function changeDictData;
  final IconData icon;
  final String title;
  DropdownIconText(
      {this.dropdownValue,
      this.values,
      this.changeDictData,
      this.icon,
      this.title});
  @override
  _DropdownIconTextState createState() => _DropdownIconTextState();
}

class _DropdownIconTextState extends State<DropdownIconText> {
  String dropdownValue;
  Function changeDictData;
  @override
  void initState() {
    super.initState();
    dropdownValue = widget.dropdownValue;
    changeDictData = widget.changeDictData;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              widget.icon,
              color: kBrown1,
            ),
            Text(
              widget.title,
              style: TextStyle(
                color: kBrown1,
              ),
            ),
          ],
        ),
        DropdownButton<String>(
          value: dropdownValue,
          dropdownColor: Color(0xFFEBEBEB),
          icon: Icon(
            Icons.arrow_drop_down,
            color: kBrown1,
          ),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(
            color: Colors.black,
          ),
          underline: Container(
            height: 2,
            color: kBrown1,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
              changeDictData(newValue);
            });
          },
          isExpanded: true,
          items: widget.values.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: new Align(alignment: Alignment.center, child: Text(value)),
            );
          }).toList(),
        ),
      ],
    );
  }
}
