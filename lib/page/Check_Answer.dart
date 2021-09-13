import 'package:flutter/material.dart';
import 'package:quiz_app_ii_example/model/question.dart';
import 'package:quiz_app_ii_example/utils/utils.configs.dart';

class SummaryAnswers extends StatelessWidget {
  final String code;

  final String text;
  final List<Question>? questions;

  const SummaryAnswers(
      {Key? key,
      required this.code,
      required this.text,
      required this.questions})
      : super(key: key);

  List<Widget> _buildAnswers() {
    List<Widget> widgets = [];

    if (questions == null) return [];

    for (int i = 0; i < questions!.length; i++) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              ///Question
              Text("${questions![i].text}"),

              /// Add your style
              ...questions![i]
                  .options
                  .map(
                    (e) => Text(
                      "${e.text}",
                      style: TextStyle(
                        color: e.isCorrect ? Colors.blue : Colors.red,
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                    child: CircleAvatar(
                      backgroundColor: circleAvatarBackground,
                      radius: circleAvatarRadius,
                      child: Text(
                        '$code',
                        style: questionStyle,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          // '${question.text}',
                          "Question",
                          style: questionStyle,
                          textAlign: TextAlign.center,
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  ..._buildAnswers().toList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
