import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if(quizBrain.isFinished() == true)
      {
        quizBrain.reset();
        scoreKeeper.clear();

        _onBasicAlertPressed(context);
      }
      else
      {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.indigo,
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.indigo],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    quizBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30.0),
                    gradient: LinearGradient(
                      colors: [Colors.greenAccent, Colors.green],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  ),
                  child: FlatButton(
                    textColor: Colors.white,
                    child: Text(
                      'Oui',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      //The user picked true.
                      checkAnswer(true);
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30.0),
                    gradient: LinearGradient(
                      colors: [Colors.pinkAccent, Colors.red],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  ),
                  child: FlatButton(
                    child: Text(
                      'Non',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      //The user picked false.
                      checkAnswer(false);
                    },
                  ),
                ),
              ),
            ),
            Row(
              children: scoreKeeper,
            )
          ],
        ),
      ),
    );
  }
}

_onBasicAlertPressed(context) {
  Alert(
      context: context,
      title: "QUIZZ DONE",
      desc: "Well done on completing the quizz.",
      buttons: [
        DialogButton(
            child: Text(
              "COOL",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.of(context, rootNavigator: true).pop())
      ],
    ).show();
}