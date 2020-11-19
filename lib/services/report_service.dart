import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:igado_front/services/api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
import 'package:excel/excel.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';

class ReportService {
  final API _api = API();
  Future<dynamic> generateReport(int farmId) async {
    Dio dio = Dio();
    var url = _api.url + 'general_report/${farmId.toString()}';
    var status = await Permission.storage.status;
    if (await Permission.storage.request().isGranted) {
      // We didn't ask for permission yet.
      Directory downloadDirectory =
          await DownloadsPathProvider.downloadsDirectory;
      String dir = downloadDirectory.path;
      var response = await dio.download(
          url,
          dir +
              '/relatorio_geral_${DateTime.now().toString().substring(0, 19)}.xlsx');
    }

// You can can also directly ask the permission about its status.
    if (await Permission.storage.isRestricted) {
      // The OS restricts access, for example because of parental controls.
      Permission.storage.request();
    }

    // try {
    //   var dio = Dio();
    //   var response = await dio.get(
    //     url,
    //     options: Options(
    //         responseType: ResponseType.bytes,
    //         followRedirects: false,
    //         receiveTimeout: 0),
    //   );
    //   // int statusCode = response.statusCode;

    //   print(response.headers);
    //   File file = File('./general_report.xlsx');
    //   var raf = file.openSync(mode: FileMode.write);

    //   raf.writeFromSync(response.data);
    //   await raf.close();
    // } catch (e) {
    //   print(e);
    // }

    // if (statusCode == 200) {
    // var dio = Dio();
    // dio.interceptors.add(LogInterceptor());
    // var excel = Excel.decodeBytes(response.body);
    // HttpClient httpClient = new HttpClient();
    // httpClient
    //     .get('192.168.0.21', 5001, '/general_report/${farmId.toString()}')
    //     .then((HttpClientRequest request) => request.close())
    //     .then((HttpClientResponse response) {
    //   response.transform(utf8.decoder).listen((contents) {
    //     // handle data
    //   });
    // });
    // var path = getApplicationDocumentsDirectory();
    // await download1(dio, url, './sheet1.xlsx');

    // return 200;
    //   } else
    //     throw Exception('Failed to create report. Error $statusCode');
    // }
  }
}

Future download1(Dio dio, String url, String savePath) async {
  CancelToken cancelToken = CancelToken();
  // var savePath = getApplicationDocumentsDirectory();
  try {
    await dio.download(url, savePath, cancelToken: cancelToken);
  } catch (e) {
    print(e);
  }
}
