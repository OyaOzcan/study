import 'package:flutter/material.dart';
import 'package:studyapp/comp/set_card.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0,
        title: Text("L I B R A R Y"),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(screenWidth * 0.02),
              children: [
                StudySetCard(
                  title: 'Microbiology',
                  flashcards: 246,
                  explanations: 195,
                  exercises: 163,
                  author: 'Dr. Smith',
                  color: Color(0xFF4285F4),
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),
                StudySetCard(
                  title: 'Artificial Intelligence',
                  flashcards: 305,
                  explanations: 294,
                  exercises: 201,
                  author: 'Prof. Johnson',
                  color: Color(0xFFEA4335),
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),
                StudySetCard(
                  title: 'Entrepreneurship',
                  flashcards: 260,
                  explanations: 154,
                  exercises: 182,
                  author: 'Ms. Wilson',
                  color: Color(0xFF34A853),
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),
                StudySetCard(
                  title: 'Political Science',
                  flashcards: 194,
                  explanations: 126,
                  exercises: 109,
                  author: 'Mr. Carter',
                  color: Color(0xFFFBBC05),
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),
              ],
            ),
          ],
        ),
      ),
    //  bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 2), // Library page index
    );
  }
}
