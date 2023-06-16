import 'package:flutter/material.dart';
import 'package:gotechtest/models/question_model.dart';
import 'package:gotechtest/providers/question_provider.dart';
import 'package:gotechtest/utils/device_utils.dart';
import 'package:gotechtest/widgets/general_container.dart';

class MultipleChoiceQuestion extends StatefulWidget {
  final Question question;
  final QuestionnaireProvider questionProvider;
  final int indexOfQuestion;

  const MultipleChoiceQuestion({
    super.key,
    required this.question,
    required this.questionProvider,
    required this.indexOfQuestion,
  });

  @override
  State<MultipleChoiceQuestion> createState() => _MultipleChoiceQuestionState();
}

class _MultipleChoiceQuestionState extends State<MultipleChoiceQuestion> {
  int? currentSelectedIndex;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.questionProvider.answers.add('');
  }

  void updateSelctedRadioButton(int index) {
    if (textEditingController.text != '' ||
        index == widget.question.aviableAnswers!.length) {
      setState(() {
        currentSelectedIndex = widget.question.aviableAnswers!.length;
        widget.questionProvider
            .updateAnswers(widget.indexOfQuestion, textEditingController.text);
      });
    } else {
      setState(() {
        currentSelectedIndex = index;
        widget.questionProvider.updateAnswers(
            widget.indexOfQuestion, widget.question.aviableAnswers![index]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      child: Column(
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
          const SizedBox(
            height: 15,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => index ==
                    widget.question.aviableAnswers?.length
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: SizedBox(
                      height: 20,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              updateSelctedRadioButton(index);
                            },
                            child: currentSelectedIndex == null
                                ? const Icon(Icons.radio_button_off_rounded)
                                : currentSelectedIndex == index
                                    ? const Icon(Icons.radio_button_on_rounded)
                                    : const Icon(
                                        Icons.radio_button_off_rounded),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10, top: 2.0),
                            child: Text('Other:'),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextField(
                                enabled: currentSelectedIndex ==
                                    widget.question.aviableAnswers!.length,
                                controller: textEditingController,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                    fontSize: DeviceUtils.getScaledFontSize(
                                        context, 12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: SizedBox(
                      height: 20,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              updateSelctedRadioButton(index);
                            },
                            child: currentSelectedIndex == null
                                ? const Icon(Icons.radio_button_off_rounded)
                                : currentSelectedIndex == index
                                    ? const Icon(Icons.radio_button_on_rounded)
                                    : const Icon(
                                        Icons.radio_button_off_rounded),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 2.0),
                            child: Text(widget.question.aviableAnswers![index]),
                          )
                        ],
                      ),
                    ),
                  ),
            itemCount:
                widget.question.answerType == AnswerType.multiChoiceWithOther
                    ? (widget.question.aviableAnswers?.length ?? 0) + 1
                    : widget.question.aviableAnswers?.length,
          )
        ],
      ),
    );
  }
}
