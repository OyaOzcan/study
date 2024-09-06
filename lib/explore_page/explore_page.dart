import 'package:flutter/material.dart';
import 'package:studyapp/explore_page/flash_card.dart';
import 'package:studyapp/explore_page/study_set.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String selectedTab = 'Flashcards';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0,
        title: Text("E X P L O R E"),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTopButton('Flashcards', selectedTab == 'Flashcards', screenWidth),
                _buildTopButton('Explanations', selectedTab == 'Explanations', screenWidth),
                _buildTopButton('Exercises', selectedTab == 'Exercises', screenWidth),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(screenWidth * 0.02),
                children: _buildContentForSelectedTab(screenHeight, screenWidth, context),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton('Sort', Icons.sort, screenWidth),
                _buildActionButton('Filter', Icons.filter_list, screenWidth),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopButton(String label, bool isActive, double screenWidth) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = label;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenWidth * 0.02),
        decoration: BoxDecoration(
          color: isActive ? Colors.teal : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.teal),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.teal,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildContentForSelectedTab(double screenHeight, double screenWidth, BuildContext context) {
    if (selectedTab == 'Flashcards') {
      return [
        StudySetCardComponent(
          title: 'Cell Membranes',
          size: '20 Flashcards',
          source: 'Community resource',
          subject: 'Biology',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FlashcardDetailPageComponent(title: 'Cell Membranes'),
              ),
            );
          },
        ),
      ];
    } else if (selectedTab == 'Explanations') {
      return [
        StudySetCardComponent(
          title: 'The Structure and Function of Cell',
          size: '1.2 MB',
          source: 'Microbiology',
          subject: 'Biology',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExplanationDetailPageComponent(),
              ),
            );
          },
        ),
      ];
    } else if (selectedTab == 'Exercises') {
      return [
        StudySetCardComponent(
          title: 'Cell Division and Genetics Practice',
          size: '15 questions',
          source: 'Microbiology',
          subject: 'Biology',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExerciseDetailPageComponent(title: 'Cell Division and Genetics Practice'),
              ),
            );
          },
        ),
        StudySetCardComponent(
          title: 'Database Management Exercises',
          size: '18 questions',
          source: 'Computer Science',
          subject: 'Computer Science',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExerciseDetailPageComponent(title: 'Database Management Exercises'),
              ),
            );
          },
        ),
      ];
    } else {
      return [];
    }
  }

  Widget _buildActionButton(String label, IconData icon, double screenWidth) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenWidth * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          SizedBox(width: screenWidth * 0.02),
          Text(label, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}

// ExerciseDetailPageComponent - to display the list of questions for the exercise
class ExerciseDetailPageComponent extends StatelessWidget {
  final String title;

  ExerciseDetailPageComponent({required this.title});

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
            Text("15 questions"),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildExerciseQuestion('What are the two main stages of the cell cycle?'),
                  _buildExerciseQuestion('During which phase of mitosis do the chromosomes align at the cell\'s equatorial plane?'),
                  _buildExerciseQuestion('What is the purpose of meiosis in sexually reproducing organisms?'),
                  _buildExerciseQuestion('Which of the following is NOT a phase of mitosis?'),
                  _buildExerciseQuestion('What structure is responsible for pulling chromatids apart during mitosis?'),
                  // Add more questions here
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
                  child: Text('Take Exercise'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExerciseQuestion(String question) {
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
      child: Text(
        question,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

// StudySetCardComponent - reusable component for study set cards
class StudySetCardComponent extends StatelessWidget {
  final String title;
  final String size;
  final String source;
  final String subject;
  final VoidCallback onTap;

  StudySetCardComponent({
    required this.title,
    required this.size,
    required this.source,
    required this.subject,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
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
        child: Row(
          children: [
            Icon(Icons.insert_drive_file, color: Colors.black),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '$size · from $source',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      subject,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.more_vert, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}


// ExplanationDetailPageComponent with ExpansionTile
class ExplanationDetailPageComponent extends StatelessWidget {
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
              "The Structure and Function of Cell",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text("1.2 MB"),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: _buildChapters(),
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
                  child: Text('Read'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // List of chapters using ExpansionTile
  List<Widget> _buildChapters() {
    return [
      ExpansionTile(
        title: Text("Chapter 1: Introduction to Cell Theory"),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This chapter covers the basics of cell theory and the discovery of cells."),
          ),
        ],
      ),
      ExpansionTile(
        title: Text("Chapter 2: Overview of Cell Types"),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This chapter discusses the different types of cells found in organisms."),
          ),
        ],
      ),
      ExpansionTile(
        title: Text("Chapter 3: The Plasma Membrane"),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This chapter explains the structure and function of the plasma membrane."),
          ),
        ],
      ),
      ExpansionTile(
        title: Text("Chapter 4: Cytoplasm and Cytoskeleton"),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This chapter details the role of the cytoplasm and cytoskeleton in cells."),
          ),
        ],
      ),
      ExpansionTile(
        title: Text("Chapter 5: The Nucleus"),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This chapter explores the structure and function of the cell nucleus."),
          ),
        ],
      ),
      ExpansionTile(
        title: Text("Chapter 6: Mitochondria"),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This chapter explains the role of mitochondria in energy production."),
          ),
        ],
      ),
      ExpansionTile(
        title: Text("Chapter 7: Endoplasmic Reticulum"),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This chapter discusses the structure and function of the endoplasmic reticulum."),
          ),
        ],
      ),
    ];
  }
}