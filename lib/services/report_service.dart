import 'dart:io';
import 'package:igado_front/services/api.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';

import 'package:path_provider/path_provider.dart';

class ReportService {
  final API _api = API();
  Future<dynamic> generateReport(int farmId) async {
    Dio dio = Dio();
    var url = _api.url + 'general_report/${farmId.toString()}';
    var status = await Permission.storage.status;
    if (await Permission.storage.request().isGranted) {
      String dir = (await getExternalStorageDirectory()).path;
      // Directory downloadDirectory =
      //     await DownloadsPathProvider.downloadsDirectory;
      // String dir = downloadDirectory.path;
      await dio.download(
          url,
          dir +
              '/relatorio_geral_${DateTime.now().toString().substring(0, 19)}.xlsx');
    }

    if (await Permission.storage.isRestricted) {
      Permission.storage.request();
    }
  }
}

Future download1(Dio dio, String url, String savePath) async {
  CancelToken cancelToken = CancelToken();
  try {
    await dio.download(url, savePath, cancelToken: cancelToken);
  } catch (e) {
    print(e);
  }
}
