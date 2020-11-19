import 'package:flutter/material.dart';
import 'package:igado_front/components/dropdown_icon_text.dart';
import 'package:igado_front/components/icon_text_form_field.dart';
import 'package:igado_front/components/visibility_form_field.dart';
import 'package:igado_front/constants.dart';
import 'package:igado_front/services/report_service.dart';
import 'package:igado_front/utils/alert_utils.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:igado_front/components/simple_card.dart';
import 'package:permission_handler/permission_handler.dart';

class CreateReportScreen extends StatefulWidget {
  @override
  _CreateReportScreenState createState() => _CreateReportScreenState();
}

class _CreateReportScreenState extends State<CreateReportScreen> {
  String reportType = 'Geral';
  Future<dynamic> response;
  @override
  void initState() {
    super.initState();
    getStoragePermission();
    // We didn't ask for permission yet.
// You can can also directly ask the permission about its status.
  }

  void getStoragePermission() async {
    var storagePermission = await Permission.storage.request();
    print(storagePermission);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBrown2,
        title: Text('Criar Relatório'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: kBackgroundTheme,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: DropdownIconText(
                  icon: Icons.assignment,
                  title: "Tipo de Relatório",
                  changeDictData: (String value) {
                    setState(() {
                      reportType = value;
                      print(reportType);
                    });
                  },
                  dropdownValue: reportType,
                  values: ['Geral', 'GMD'],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: kBrown2),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        response = ReportService()
                            .generateReport(1)
                            .then((value) => showAlert(
                                  "Relatório gerado com sucesso!",
                                  context,
                                  null,
                                ))
                            .catchError((e) {
                          print(e);
                          showAlert(
                            "Opa, não foi possível gerar seu relatório, tente novamente mais tarde.",
                            context,
                            null,
                          );
                        });
                      });
                    },
                    child: Text(
                      'Gerar Relatório',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: kBrown2,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
