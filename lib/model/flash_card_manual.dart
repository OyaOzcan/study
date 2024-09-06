class FlashCard {
  final String front;
  final String back;

  FlashCard({required this.front, required this.back});

  // Factory constructor to create a FlashCard from a Map
  factory FlashCard.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      throw Exception('Null data provided to fromMap constructor');
    }
    return FlashCard(
      front: map['front'] ?? '',  // Use null-aware operators to avoid null errors
      back: map['back'] ?? '',
    );
  }
}
