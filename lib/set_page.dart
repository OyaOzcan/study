import 'package:flutter/material.dart';
import 'package:studyapp/flashcard/quiz/flash_card.dart';
import 'package:studyapp/set_details/quizpage.dart';
import 'package:studyapp/summary_card.dart';
import 'model/flash_card.dart';
import 'model/summary_card.dart'; // Import the SummaryCard model
import 'package:flutter/material.dart';
import 'package:studyapp/flashcard/quiz/flash_card.dart';
import 'package:studyapp/summary_card.dart';
import 'model/flash_card.dart';
import 'model/summary_card.dart';
import 'model/quiz_question.dart'; // Import the QuizQuestion model

class StudyPage extends StatefulWidget {
  final String title;

  StudyPage({required this.title});

  @override
  _StudyPageState createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isAdded = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F5),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          widget.title, 
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: TabBar(
            controller: _tabController,
            indicatorColor: Color(0xFF1A2136),
            labelColor: Color(0xFF1A2136),
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'Material'),
              Tab(text: 'Your Progress'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMaterialTab(screenHeight, screenWidth),
          Center(child: Text('Progress tab')),
        ],
      ),
      bottomNavigationBar: _buildAddToLibraryButton(screenWidth),
    );
  }

  Widget _buildMaterialTab(double screenHeight, double screenWidth) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Flashcards', 46),
            _buildListItem('Cell Anatomy & Structure', '15 flashcards', screenWidth, [
              Flashcard(term: 'Cell Membrane', explanation: 'The cell membrane is the outer lining of the cell.'),
              Flashcard(term: 'Cytoplasm', explanation: 'The cytoplasm is a jelly-like fluid inside the cell.'),
            ]),
            _buildListItem('Cell Membranes', '20 flashcards', screenWidth, []),
            SizedBox(height: screenHeight * 0.02),
            _buildSectionHeader('Explanations', 13),
            _buildListItemWithIcon('Microbial Physiology', 'Microbial Physiology Description', screenWidth, Icons.description_outlined, [
              SummaryCard(title: 'Microbial Physiology Overview', description: 'This is an introduction to microbial physiology.'),
              SummaryCard(title: 'Metabolism', description: 'Description of microbial metabolism and its functions.'),
            ]),
            _buildListItemWithIcon('The Structure and Function of Cells', 'Explanation for Structure and Function of Cells', screenWidth, Icons.description_outlined, [
              SummaryCard(title: 'Cell Functions Overview', description: 'An overview of the structure and function of cells.'),
              SummaryCard(title: 'Organelles', description: 'Details of various organelles and their roles in cells.'),
            ]),
            SizedBox(height: screenHeight * 0.02),
            _buildSectionHeader('Exercises', 21),
            _buildListItemForQuiz('Cell Division & Mitosis', '10 questions', screenWidth, [
              QuizQuestion(question: 'What is the purpose of mitosis?', options: ['Growth', 'Repair', 'Reproduction', 'All of the above'], correctAnswer: 'All of the above'),
              QuizQuestion(question: 'In which phase of mitosis do chromosomes align?', options: ['Prophase', 'Metaphase', 'Anaphase', 'Telophase'], correctAnswer: 'Metaphase'),
            ]),
            _buildListItemForQuiz('Cell Division and Genetics Practice', '20 questions', screenWidth, []),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title ($count)',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Text(
                'View All',
                style: TextStyle(color: Color(0xFF1A2136), fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_forward, color: Color(0xFF1A2136), size: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildListItem(String title, String subtitle, double screenWidth, List<Flashcard> flashcards) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey)),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          if (flashcards.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FlashcardPage(flashcards: flashcards),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildListItemWithIcon(String title, String subtitle, double screenWidth, IconData icon, List<SummaryCard> summaryCards) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey)),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SummaryCardPage(summaryCards: summaryCards),
            ),
          );
        },
      ),
    );
  }

  // This method is for navigating to the QuizPage with a list of questions
  Widget _buildListItemForQuiz(String title, String subtitle, double screenWidth, List<QuizQuestion> questions) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey)),
        trailing: Icon(Icons.more_vert),
        onTap: () {
          if (questions.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuizPage(questions: questions), // Navigate to QuizPage
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildAddToLibraryButton(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            isAdded = !isAdded;
          });
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(vertical: 16, horizontal: screenWidth * 0.2),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(isAdded ? Colors.white : Color(0xFF1A2136)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(color: Color(0xFF1A2136)),
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isAdded ? Icons.check : Icons.add,
              color: isAdded ? Color(0xFF1A2136) : Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              isAdded ? 'Added to My Library' : 'Add to My Library',
              style: TextStyle(
                color: isAdded ? Color(0xFF1A2136) : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
