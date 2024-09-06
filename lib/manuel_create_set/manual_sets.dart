import 'package:flutter/material.dart';
import 'package:studyapp/manuel_create_set/flash_cards.dart';
import 'package:studyapp/manuel_create_set/quiz_page.dart';
import 'package:studyapp/manuel_create_set/write_page.dart';
import 'package:studyapp/model/flash_card_manual.dart';

class DeckOptionsPage extends StatelessWidget {
  final String deckName;
  final List<FlashCard> flashCards;

  DeckOptionsPage({required this.deckName, required this.flashCards});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(deckName),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LearnPage(
                            deckName: deckName,
                            flashCards: flashCards,
                          ),
                        ),
                      );
                    },
                    child: Text('Öğren'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WritePage(
                            deckName: deckName,
                            flashCards: flashCards,
                          ),
                        ),
                      );
                    },
                    child: Text('Yaz'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('quzzzz gooo');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizPage(
                            flashCards: flashCards,
                          ),
                        ),
                      );
                    },
                    child: Text('Quiz'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
