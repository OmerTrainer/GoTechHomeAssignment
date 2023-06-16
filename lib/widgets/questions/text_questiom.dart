import 'package:flutter/material.dart';
import 'package:gotechtest/models/question_model.dart';
import 'package:gotechtest/providers/question_provider.dart';
import 'package:gotechtest/widgets/general_container.dart';

import '../../utils/device_utils.dart';

class TextQuestion extends StatefulWidget {
  final Question question;
  final QuestionnaireProvider questionProvider;
  final int indexOfQuestion;
  const TextQuestion({
    super.key,
    required this.question,
    required this.questionProvider,
    required this.indexOfQuestion,
  });

  @override
  State<TextQuestion> createState() => _TextQuestionState();
}

class _TextQuestionState extends State<TextQuestion> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();

    widget.questionProvider.answers.add('');
    widget.questionProvider.textQuestionsValues
        .addAll({"${widget.indexOfQuestion}": textEditingController});
  }

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.question.content,
                style: TextStyle(
                    fontSize: DeviceUtils.getScaledFontSize(context, 14),
                    fontWeight: FontWeight.w400),
              ),
              widget.question.isRequired
                  ? const Text(
                      ' *',
                      style: TextStyle(color: Colors.red),
                    )
                  : const SizedBox.shrink()
            ],
          ),
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: 'Your answer',
              hintStyle: TextStyle(
                fontSize: DeviceUtils.getScaledFontSize(context, 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
