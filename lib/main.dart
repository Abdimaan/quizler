import 'package:rflutter_alert/rflutter_alert.dart';
import 'quize_brain.dart';
import 'package:flutter/material.dart';

QuizeBrain quizebrain = QuizeBrain();

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Quizepage(),
  ));
}

class Quizepage extends StatefulWidget {
  @override
  State<Quizepage> createState() => _QuizepageState();
}

class _QuizepageState extends State<Quizepage> {
  void showQuizEndAlert(BuildContext context) {
    Alert(
      context: context,
      title: 'Quiz Ended!',
      desc: 'Congratulations! You have completed the quiz.',
      buttons: [
        DialogButton(
          child: Text(
            'Start Again',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            setState(() {
              scorekeeper.clear(); // Clear scorekeeper list
              quizebrain.reset(); // Add a reset() method in QuizeBrain class to reset the question number
            });
            Navigator.pop(context); // Close the alert dialog
          },
          width: 120,
        ),
      ],
    ).show();
  }

  List<Icon> scorekeeper = [];

  void chekanswer(bool user) {
    bool correctAnswer = quizebrain.getCorrectAnswer();
    setState(() {
      if (user == correctAnswer) {
        scorekeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scorekeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }

      if (quizebrain.isQuizEnd()) {
        showQuizEndAlert(context); // Show the alert when the quiz ends
      } else {
        quizebrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      quizebrain.getQuestion(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Container(
                      width: 400,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          chekanswer(true);
                        },
                        child: Text(
                          'true',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 100.0),
                    child: Container(
                      width: 400,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          chekanswer(false);
                        },
                        child: Text(
                          'false',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: scorekeeper,
              ),
            ],
          ),
        ),
      ),
    );
  }
}