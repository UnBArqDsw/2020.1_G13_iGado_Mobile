import 'package:flutter/material.dart';
import 'package:igado_front/components/icon_text_form_field.dart';
import 'package:igado_front/components/visibility_form_field.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/services/report_service.dart';
import 'package:igado_front/utils/alert_utils.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:igado_front/components/simple_card.dart';

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
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/create_report');
                  },
                  child: Text(
                    'Novo Relatório',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            color: kBrown2,
          ),
          SizedBox(height: 0),
        ],
      ),
    );
  }
}
