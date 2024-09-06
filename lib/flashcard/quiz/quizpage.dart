import 'package:flutter/material.dart';
import 'package:studyapp/model/quiz_question.dart';

class QuizPage extends StatefulWidget {
  final List<QuizQuestion> questions;

  QuizPage({Key? key, required this.questions}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;  // Track the current question index
  bool _showResult = false;  // Whether to show the quiz results
  String? _selectedAnswer; // Track the selected answer
  bool _answered = false;  // Whether the current question is answered

  void _selectAnswer(String answer) {
    setState(() {
      _selectedAnswer = answer;
    });
  }

  void _markAnswer() {
    setState(() {
      if (_selectedAnswer != null) {
        widget.questions[_currentIndex].userAnswer = _selectedAnswer;
        widget.questions[_currentIndex].isCorrect = _selectedAnswer == widget.questions[_currentIndex].correctAnswer;
        _answered = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentIndex == widget.questions.length - 1) {
        _showResult = true;
      } else {
        _currentIndex++;
        _selectedAnswer = null;
        _answered = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showResult) {
      int correctCount = widget.questions.where((q) => q.isCorrect == true).length;
      return Scaffold(
        appBar: AppBar(title: Text("Quiz Result")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You answered $correctCount out of ${widget.questions.length} correctly!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Finish'),
              ),
            ],
          ),
        ),
      );
    }

    final question = widget.questions[_currentIndex];
    return Scaffold(
      appBar: AppBar(title: Text("Quiz")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.question,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ...question.options.map((option) {
              bool isSelected = option == _selectedAnswer;
              bool isCorrect = option == question.correctAnswer;
              return GestureDetector(
                onTap: !_answered ? () => _selectAnswer(option) : null,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _answered && isSelected ? (isCorrect ? Colors.green : Colors.red) : (isSelected ? Colors.grey : Colors.white),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              );
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectedAnswer != null ? _markAnswer : null,
              child: Text('Mark Answer'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _answered ? _nextQuestion : null,
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
