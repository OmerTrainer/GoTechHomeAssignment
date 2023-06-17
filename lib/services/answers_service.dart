import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:restart_app/restart_app.dart';

class AnswersService {
  static const String baseUrl = 'http://10.0.2.2:3000/answers';

  static void saveAllAnswers(List<String> answers) async {
    await http
        .post(Uri.parse(baseUrl),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(
                {"id": Random().nextInt(10000000), "answers": answers}))
        .then((value) {
      Restart.restartApp();
    });
  }
}
