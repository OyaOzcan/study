import 'package:flutter/material.dart';
import 'package:studyapp/set_page.dart';

class StudySetCard extends StatelessWidget {
  final String title;
  final int flashcards;
  final int explanations;
  final int exercises;
  final String author;
  final Color color;
  final double screenHeight;
  final double screenWidth;

  StudySetCard({
    required this.title,
    required this.flashcards,
    required this.explanations,
    required this.exercises,
    required this.author,
    required this.color,
    required this.screenHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Tıklandığında StudyPage sayfasına yönlendirme yapılır
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudyPage(title: title), // StudyPage'e title ile yönlendirme
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: screenHeight * 0.02),
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
        height: screenHeight * 0.18,
        child: Row(
          children: [
            Container(
              width: screenWidth * 0.02,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$flashcards flashcards · $explanations explanations · $exercises exercises',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                    Divider(),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(screenWidth * 0.015),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.person_outline, size: screenWidth * 0.045, color: Colors.grey),
                              SizedBox(width: screenWidth * 0.015),
                              Text(
                                author,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenWidth * 0.03,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.public, size: screenWidth * 0.04, color: Colors.grey),
                        SizedBox(width: screenWidth * 0.03),
                        Icon(Icons.more_vert, size: screenWidth * 0.04, color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
