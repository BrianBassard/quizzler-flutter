import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red[100],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: QuizPage(),
            ),
          ),
        ),
      ),
    );
  }
}

//test
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(
          Icon(Icons.check, color: Colors.cyan[200]),
        );
      } else
        scoreKeeper.add(
          Icon(Icons.close, color: Colors.orange[100]),
        );

      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    var padding2 = Padding(
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
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 150.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: padding2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                textColor: Colors.white,
                color: Colors.cyan[200],
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  checkAnswer(true);
                  //The user picked true.
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.orange[100],
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkAnswer(false);
                  //The user picked false.
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: scoreKeeper,
            ),
          )
        ],
      ),
    );
  }
}

/*
'You can lead a cow down stairs but not up stairs.', false,
'Approximately one quarter of human bones are in the feet.', true,
'A slug\'s blood is green.', true,
*/
