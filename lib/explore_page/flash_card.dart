
// FlashcardComponent - reusable component for flashcards in the detail view
import 'package:flutter/material.dart';

// FlashcardDetailPageComponent - reusable component for the flashcard detail page
class FlashcardDetailPageComponent extends StatelessWidget {
  final String title;

  FlashcardDetailPageComponent({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.share),
                        title: Text('Share'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.library_books),
                        title: Text('Go to Study Set'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.flag),
                        title: Text('Report'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text("20 flashcards"),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  FlashcardComponent(
                    question: 'What is the function of aquaporins in the cell membrane?',
                  ),
                  FlashcardComponent(
                    question: 'What is the difference between osmosis and diffusion?',
                  ),
                  // Add more flashcards here
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Add to My Study'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    //primary: Colors.teal
                    ),
                  child: Text('Play'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class FlashcardComponent extends StatelessWidget {
  final String question;

  FlashcardComponent({required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(
            'Tap to flip',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}