class SummaryCard {
  final String title;
  final String description;

  SummaryCard({
    required this.title,
    required this.description,
  });

  factory SummaryCard.fromJson(Map<String, dynamic> json) {
    return SummaryCard(
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }
}
