import 'dart:convert';
import 'package:http/http.dart' as http;

class QuizQuestion {
  final String question;
  final List<String> options;
  final String correctAnswer;
  String? userAnswer; // To store the user's answer
  bool? isCorrect; // To store if the user's answer was correct

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
    this.userAnswer,
    this.isCorrect,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      question: json['question'] as String,
      options: List<String>.from(json['options']),
      correctAnswer: json['correctAnswer'] as String,
    );
  }

  void answer(String answer) {
    userAnswer = answer;
    isCorrect = answer == correctAnswer;
  }
}
