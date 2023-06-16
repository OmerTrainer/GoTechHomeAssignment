import 'package:flutter/material.dart';
import 'package:gotechtest/services/answers_service.dart';

class QuestionnaireProvider with ChangeNotifier {
  List<String> answers = [];
  List<int> requiredQuestionsIndexes = [];
  Map<String, TextEditingController> textQuestionsValues = {};

  void updateAnswers(int index, String newVal) {
    answers[index] = newVal;
  }

  void submitForm() {
    textQuestionsValues.forEach((key, value) {
      updateAnswers(int.parse(key), value.text);
    });
    if (isAnswersValidated()) {
      AnswersService.saveAllAnswers(answers);
    }
  }

  bool isAnswersValidated() {
    //validates for required questions
    for (int i = 0; i < requiredQuestionsIndexes.length; i++) {
      if (answers[requiredQuestionsIndexes[i]].isEmpty) {
        return false;
      }
    }
    return true;
  }
}
