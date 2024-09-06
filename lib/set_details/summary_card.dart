import 'package:flutter/material.dart';
import 'package:studyapp/model/summary_card.dart';

class SummaryCardPage extends StatelessWidget {
  final List<SummaryCard> summaryCards;

  SummaryCardPage({Key? key, required this.summaryCards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Summary Cards")),
      body: PageView.builder(
        itemCount: summaryCards.length,
        itemBuilder: (context, index) {
          final summaryCard = summaryCards[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      summaryCard.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      summaryCard.description,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
