class Flashcard {
  final String term;
  final String explanation;

  Flashcard({required this.term, required this.explanation});

  factory Flashcard.fromJson(Map<String, dynamic> json) {
    return Flashcard(
      term: json['term'] as String,
      explanation: json['explanation'] as String,
    );
  }
}
