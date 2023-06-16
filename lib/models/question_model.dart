enum AnswerType {
  multiChoice,
  multiChoiceWithOther,
  text,
}

class Question {
  static AnswerType parse(String value) {
    return AnswerType.values.firstWhere(
      (type) => type.toString().split('.').last == value,
      orElse: () => AnswerType.text, // Default value if no match is found
    );
  }

  static List<String>? parseToListString(List<dynamic>? strings) {
    if (strings == null) {
      return null;
    }
    return strings.map((e) => e.toString()).toList();
  }

  final String content;
  final bool isRequired;
  final List<String>? aviableAnswers;
  final AnswerType answerType;

  const Question({
    required this.content,
    required this.answerType,
    required this.aviableAnswers,
    required this.isRequired,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      content: json['content'],
      aviableAnswers: Question.parseToListString(json["AviableAnswers"]),
      answerType: Question.parse(json['AnswersType']),
      isRequired: json["IsRequired"],
    );
  }
}
