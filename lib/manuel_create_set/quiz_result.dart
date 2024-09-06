import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:studyapp/model/flash_card_manual.dart';

class QuizResultPage extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final List<bool> answerResults;
  final List<FlashCard> flashCards;

  QuizResultPage({
    required this.correctAnswers,
    required this.totalQuestions,
    required this.answerResults,
    required this.flashCards,
  });

  @override
  Widget build(BuildContext context) {
    double percent = correctAnswers / totalQuestions;
    percent = percent.isFinite ? percent : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 13.0,
              animation: true,
              percent: percent,
              center: Text(
                "${(percent * 100).toInt()}%",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              progressColor: Colors.green,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: totalQuestions,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(flashCards[index].front),
                    trailing: Icon(
                      answerResults[index] ? Icons.check_circle : Icons.cancel,
                      color: answerResults[index] ? Colors.green : Colors.red,
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Return to Decks'),
            ),
          ],
        ),
      ),
    );
  }
}
