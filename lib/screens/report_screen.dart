import 'package:flutter/material.dart';
import 'package:igado_front/constants.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FlatButton(
            minWidth: 150,
            onPressed: () {
              Navigator.pushNamed(context, '/create_report');
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Text(
                  'Novo Relatório',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            color: kBrown2,
          ),
          SizedBox(
            height: 0,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
