import 'package:flutter/material.dart';
import 'package:quizApp/model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name(
        "The U.S Declaration of Independnece was adopted in 1776.", true),
    Question.name("The Supreme law of the land is the Constitution.", true),
    Question.name(
        "The two right in the declaration of Independence are:"
        " \n Life "
        " \n Pursuit of happiness.",
        true),
    Question.name("The U.S. Constitution has 26 Amendments.", false),
    Question.name(
        "Freedom of religion means: \nYou can practice any religion, "
        "or not practice a religion.",
        true),
    Question.name("Journalist is one branch or part of the government.", false),
    Question.name("The Congress does not make federal laws.", false),
    Question.name("There are 100 U.S. Senators.", true),
    Question.name("We elect a U.S. Representative for 2 years.", true),
    Question.name("We elect a U.S. Senator for 4 years.", false),
    Question.name("A U.S. Represents all people of the United States.", false),
    Question.name("We vote for President in January.", false),
    Question.name("Who vetoes bills is the President.", true),
    Question.name("The Constitution was written in 1787.", true),
    Question.name('George Bush is the \ " Father of Our Country " \.', false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "True Citizen",
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,

      //we use [Builder] here to use a [context] that is descendent of [Scaffold]
      //or else [Scaffold.of] will return null
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset("images/flag.png", width: 300, height: 230),
              ),

              // display questionaire
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid)),
                  height: 120.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        questionBank[_currentQuestionIndex].questionText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 19.9,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
              // the foor different
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () => _prevQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "TRUE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "FALSE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_forward, color: Colors.white),
                  )
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackBar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(microseconds: 500),
          content: Text("Correct!"));
      Scaffold.of(context).showSnackBar(snackBar);
      _updateQuestion();

      //correct answer
      debugPrint("Yes Correct!");
    } else {
      debugPrint("Incorrect!");
      final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          duration: Duration(microseconds: 500),
          content: Text("Incorrect!"));
      Scaffold.of(context).showSnackBar(snackBar);
      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}
