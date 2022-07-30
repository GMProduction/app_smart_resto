import 'dart:developer';

import 'package:dio/dio.dart';

import '../helper/static_variable.dart';

Future<String> sendChat(Map<String, dynamic> data) async {
  String answer = 'Hai, maaf kami belum punya jawaban tentang pertanyaan mu..';
  try {
    var formData = FormData.fromMap(data);
    final response = await Dio().post("$HostAddress/nlp/execute",
        options: Options(headers: {
          "Accept": "application/json",
        }),
        data: formData);
    List<dynamic> _answers = response.data['data']['answers'] as List;
    if (_answers.length > 0) {
      String tmpAnswer = response.data['data']['answer'] as String;
      answer = tmpAnswer;
    }
  } on DioError catch (e) {
    log(e.response!.data.toString());
  }
  return answer;
}
