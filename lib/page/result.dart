import 'package:flutter/material.dart';
import 'package:quiz_app_ii_example/data/result_manager.dart';
import 'package:quiz_app_ii_example/page/Check_Answer.dart';




class ResultPage extends StatefulWidget {
  ResultPage({Key? key}) : super(key: key);
  @override
  _ResultPageState createState() => _ResultPageState();
}
class _ResultPageState extends State<ResultPage> {
  late int _totalQuestion, _currectAnswer = 0;
  @override
  void initState() {
    _totalQuestion = userResult.length;
    userResult.forEach((element) {
      if (element) _currectAnswer++;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) { final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Quiz Result'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepOrange, Colors.purple],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Your score: $_currectAnswer / $_totalQuestion"),const SizedBox(height: 30),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SummaryAnswers()),
                  );
                },
                child: const Text('Check Answer')
              ),
            ],
          ),
        ),
      ),
    );


  }


}

