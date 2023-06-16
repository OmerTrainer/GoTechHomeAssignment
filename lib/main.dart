import 'package:flutter/material.dart';
import 'package:gotechtest/models/question_model.dart';
import 'package:gotechtest/providers/question_provider.dart';
import 'package:gotechtest/services/questions_service.dart';
import 'package:gotechtest/utils/device_utils.dart';
import 'package:gotechtest/widgets/questions/multichoice_question.dart';
import 'package:gotechtest/widgets/questions/text_questiom.dart';
import 'package:gotechtest/widgets/top_serction.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoTechTest',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => QuestionnaireProvider(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Question> questions = [];
  late QuestionnaireProvider questionProvider;

  @override
  void initState() {
    super.initState();
    questionProvider =
        Provider.of<QuestionnaireProvider>(context, listen: false);
    fetchQuestionsData();
  }

  void fetchQuestionsData() async {
    questions = await QuestionsService.getAllQuestions();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: questions.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TopSection(),
                  Expanded(
                    child: ListView.builder(
                      //The Page is Scrollable incase of added questions
                      itemBuilder: (context, index) {
                        if (questions[index].isRequired) {
                          questionProvider.requiredQuestionsIndexes.add(index);
                        }
                        if (questions[index].answerType == AnswerType.text) {
                          return TextQuestion(
                            question: questions[index],
                            questionProvider: questionProvider,
                            indexOfQuestion: index,
                          );
                        }
                        if (questions[index].answerType ==
                                AnswerType.multiChoice ||
                            questions[index].answerType ==
                                AnswerType.multiChoiceWithOther) {
                          return MultipleChoiceQuestion(
                            question: questions[index],
                            questionProvider: questionProvider,
                            indexOfQuestion: index,
                          );
                        }

                        return const SizedBox.shrink();
                      },
                      itemCount: questions.length,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      questionProvider.submitForm(context, () {
                        setState(() {
                          questions = [];
                          fetchQuestionsData();
                        });
                      });
                    },
                    child: Container(
                      height: DeviceUtils.getScaledHeight(context, 0.036),
                      width: DeviceUtils.getScaledWidth(context, 0.22),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.deepPurple,
                      ),
                      child: const Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
