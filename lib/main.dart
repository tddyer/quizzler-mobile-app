import 'package:flutter/material.dart';
import 'question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[100],
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

  int questionNum = 0;
  List<Icon> scoreKeeper = [];

  List<Question> questionList = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(q: 'Approximately one quarter of human bones are in the feet.', a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionList[questionNum % questionList.length].question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.grey[800],
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey[800],
                  width: 2.5,
                )
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //true was chosen
                setState(() {
                  if (questionList[questionNum % questionList.length].checkAnswer(true))
                    print('correct');
                  else
                    print('incorrect');
                  questionNum++;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.grey[100],
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey[800],
                  width: 2.5,
                )
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey[800],
                ),
              ),
              onPressed: () {
                //false was chosen
                setState(() {
                  if (questionList[questionNum % questionList.length].checkAnswer(false))
                    print('correct');
                  else
                    print('incorrect');
                  questionNum++;
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
