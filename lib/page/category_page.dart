import 'package:flutter/material.dart';
import 'dart:async';
import 'package:quiz_app_ii_example/page/result.dart';
import 'package:quiz_app_ii_example/data/result_manager.dart';
import 'package:quiz_app_ii_example/model/category.dart';
import 'package:quiz_app_ii_example/model/option.dart';
import 'package:quiz_app_ii_example/model/question.dart';
import 'package:quiz_app_ii_example/widget/question_numbers_widget.dart';
import 'package:quiz_app_ii_example/widget/questions_widget.dart';

@override
class CategoryPage extends StatefulWidget {
  final Category category;
  const CategoryPage({Key? key, required this.category}) : super(key: key);
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  PageController? controller;
  Question? question;

  int i = 1;
  bool canceltimer = false;
  int maxTimeInSec = 5;

  late Timer timer;

  @override
  void initState() {
    super.initState();

    controller = PageController();
    question = widget.category.questions.first;
    userResult =
        List.generate(widget.category.questions.length, (index) => false);
    selected =
        List.generate(widget.category.questions.length, (index) => false);

    starttimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context) as PreferredSizeWidget?,
        body: QuestionsWidget(
          category: widget.category,
          controller: controller,
          onChangedPage: (index) {
            nextQuestion(index: index);
          },
          onClickedOption: selectOption,
        ),
      );
  void starttimer() async {
    const onesec = Duration(seconds: 1);
    timer = Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (maxTimeInSec < 1) {
          t.cancel();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(
                questions: widget.category.questions,
              ),
            ),
          );
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          maxTimeInSec = maxTimeInSec - 1;
        }
      });
    });
  }

  // bool canceltimer = false;

  Widget buildAppBar(context) => AppBar(
        title: Text(maxTimeInSec.toString()),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrange, Colors.purple],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: QuestionNumbersWidget(
              questions: widget.category.questions,
              question: question,
              onClickedNumber: (index) =>
                  nextQuestion(index: index, jump: true),
            ),
          ),
        ),
      );

  void selectOption(Option option) {
    setState(() {
      selected[controller!.page!.ceil()] = true;
    });
    if (question!.isLocked) {
      return;
    } else {
      setState(() {
        userResult[controller!.page!.ceil()] = option.isCorrect;
        question!.isLocked = false;
        question!.selectedOption = option;
      });
      print(option.isCorrect);
      print(userResult.toString());
    }
  }

  void nextQuestion({int? index, bool jump = false}) {
    final nextPage = controller!.page! + 1;
    final indexPage = index ?? nextPage.toInt();

    setState(() {
      question = widget.category.questions[indexPage];
    });

    if (jump) {
      controller!.jumpToPage(indexPage);
    }
  }
}
