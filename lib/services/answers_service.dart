import 'dart:convert';

import 'package:http/http.dart' as http;

class AnswersService {
  static const String baseUrl = 'http://10.0.2.2:3000/answers';

  static void saveAllAnswers(List<String> answers, Function restartPage) async {
    await http.post(Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(answers));

    restartPage();
  }
}
