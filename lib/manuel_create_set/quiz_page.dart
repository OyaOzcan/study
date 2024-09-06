import 'dart:math';
import 'package:flutter/material.dart';
import 'package:studyapp/manuel_create_set/quiz_result.dart';
import 'package:studyapp/model/flash_card_manual.dart';

class QuizPage extends StatefulWidget {
  final List<FlashCard> flashCards;

  QuizPage({required this.flashCards});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  List<String> options = [];
  bool isAnswered = false;
  String selectedAnswer = '';
  int correctAnswers = 0;
  List<bool> answerResults = [];

  @override
  void initState() {
    super.initState();
    if (widget.flashCards.isNotEmpty) {
      _generateOptions();
    }
  }

  void _generateOptions() {
    if (widget.flashCards.isEmpty) return;
    Set<String> optionsSet = {widget.flashCards[currentIndex].back};
    Random random = Random();

    while (optionsSet.length < min(4, widget.flashCards.length)) {
      String randomOption = widget.flashCards[random.nextInt(widget.flashCards.length)].back;
      optionsSet.add(randomOption);
    }

    setState(() {
      options = optionsSet.toList()..shuffle();
    });
  }

  void checkAnswer(String answer) {
    bool isCorrect = widget.flashCards[currentIndex].back == answer;
    setState(() {
      isAnswered = true;
      selectedAnswer = answer;
      answerResults.add(isCorrect);
      if (isCorrect) {
        correctAnswers++;
      }

      // Bir süre sonra otomatik olarak sonraki soruya geç
      Future.delayed(Duration(seconds: 1), () {
        nextQuestion();
      });
    });
  }

  void nextQuestion() {
    if (currentIndex < widget.flashCards.length - 1) {
      setState(() {
        currentIndex++;
        isAnswered = false;
        selectedAnswer = '';
        _generateOptions();
      });
    } else {
      showResults();
    }
  }

  void showResults() {
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => QuizResultPage(
        correctAnswers: correctAnswers,
        totalQuestions: widget.flashCards.length,
        answerResults: answerResults,
        flashCards: widget.flashCards,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: widget.flashCards.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LinearProgressIndicator(
                    value: (currentIndex + 1) / widget.flashCards.length,
                    backgroundColor: Colors.grey[300],
                    color: Colors.green,
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.flashCards[currentIndex].front,
                    style: TextStyle(fontSize: 24, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ...options.map((option) {
                    bool isCorrect = widget.flashCards[currentIndex].back == option;
                    Color optionColor = !isAnswered
                        ? Colors.white
                        : (isCorrect
                            ? Colors.green.shade400
                            : (option == selectedAnswer
                                ? Colors.red.shade400
                                : Colors.white));

                    return GestureDetector(
                      onTap: isAnswered ? null : () => checkAnswer(option),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: optionColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Text(
                          option,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
    );
  }
}
