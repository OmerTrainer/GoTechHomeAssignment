import 'dart:convert';
import 'package:gotechtest/models/question_model.dart';
import 'package:http/http.dart' as http;

class QuestionsService {
  static const String baseUrl = 'http://10.0.2.2:3000/questions';

  static Future<List<Question>> getAllQuestions() async {
    List<Question> questions = [];
    http.Response response = await http.get(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> questionsData = jsonDecode(response.body);
      questions
          .addAll(questionsData.map((question) => Question.fromJson(question)));
      return questions;
    } else {
      throw Exception('Failed to get all Questions.');
    }
  }
}
