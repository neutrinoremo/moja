import 'package:flutter/material.dart';
import 'package:quiz_app_ii_example/data/questions.dart';
import 'package:quiz_app_ii_example/model/option.dart';
import 'package:quiz_app_ii_example/model/question.dart';
import 'package:quiz_app_ii_example/widget/questions_widget.dart';
import 'package:quiz_app_ii_example/widget/question_numbers_widget.dart';
import 'package:quiz_app_ii_example/data/result_manager.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app_ii_example/model/option.dart';
import 'package:quiz_app_ii_example/model/question.dart';
import 'package:quiz_app_ii_example/utils.dart';


const textColor = Colors.white;

const scoreHeaderStyle = TextStyle(
  letterSpacing: 2.0,
  color: Colors.orange,
  fontSize: 16,
  fontWeight: FontWeight.w400,
  shadows: [
    Shadow(
      blurRadius: 2.0,
      color: Colors.red,
    ),
  ],
);
const questionsHeaderStyle = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic);

const answerBoxColor = Color(0xff283593);

const questionCircleAvatarBackground = Color(0xff22273a);

const questionCircleAvatarRadius = 14.0;

const answersLeadingStyle =
TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700);

const answersStyle =
TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);

//
// ** Summary page **
//
const dividerHeight = 12.0;
const dividerColor = Colors.white;

const circleAvatarRadius = 12.0;
//const circleAvatarBackground = Colors.blue;
const circleAvatarBackground = Color(0xff4a5580);

const summaryScoreStyle = TextStyle(
    color: Colors.lime,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic);

const questionHeaderStyle = TextStyle(
    color: Colors.white54,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic);

const questionStyle = TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

const correctsHeaderStyle = TextStyle(
  color: Colors.greenAccent,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

const wrongsHeaderStyle = TextStyle(
  color: Colors.redAccent,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

const notAnsweredHeaderStyle = TextStyle(
  color: Color(0xffe1e1e1),
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

const correctAnswerStyle =
TextStyle(color: Colors.green, fontWeight: FontWeight.w600);

const wrongAnswerStyle = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic);

const notChosenStyle = TextStyle(
    color: Color(0xffe1e1e1),
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic);
class SummaryAnswers extends StatelessWidget {
  final String code;

  final String text;
  final Question question;


  const SummaryAnswers({Key? key,
    required this.code,

    required this.text,
    required this.question
  }) : super(key: key);



  List<Widget> _buildAnswers(Question question)  {
    final widgets = List<Widget>.empty(growable: true)
      ..addAll(
        question.options.map((option) {
          return Text(
            text,
            style: option.isCorrect
                ? correctAnswerStyle
                : !option.isCorrect ? wrongAnswerStyle : notChosenStyle,
          );
        }),
      );

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child: Text('${question.text}',
                        style: questionStyle, textAlign: TextAlign.center),
                  )),
            ],
          ),
          Column(children: _buildAnswers(question)),
        ],
      ),
    );
  }
}