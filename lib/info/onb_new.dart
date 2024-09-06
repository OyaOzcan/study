import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:studyapp/comp/button.dart';
import 'package:studyapp/info/age_select.dart';
import 'package:studyapp/info/loading.dart';
import 'package:studyapp/info/question_choice.dart';
import 'package:studyapp/info/reminder.dart';
import 'package:studyapp/info/subject_select.dart';
import 'package:studyapp/info/year_select.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Variables to store user inputs
  int _selectedAge = 20;
  String _goal = 'Improve my grades';
  String _educationLevel = 'College/University';
  String _university = 'Harvard University';
  String _subject = 'Biology';
  String _year = 'College';
  String _reminderTime = '20:00';
  double _progress = 0.65;

  final List<Map<String, dynamic>> questions = [
    {
      'title': "What brings you here?",
      'subtitle': "Choose the reason that best describes why you're here.",
      'options': [
        'Improve my grades',
        'Prepare for exams',
        'Learn new subjects',
        'Supplement my studies',
        'Get organized for the semester',
        'Other'
      ],
      'selected': 'Improve my grades',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top Container with a Rounded Bottom for the header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 340,
              decoration: const BoxDecoration(
                color: Color(0xFF1A2136),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
          ),
          // Circle icon in the center
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[100],
              child: Icon(
                Icons.eco,
                color: Colors.green,
                size: 50,
              ),
            ),
          ),
          // Content of the page
          Positioned(
            top: 400,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: questions.length + 6,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      if (index == 0) return buildWelcomePage();
                      if (index == 1)
                        return AgeSelectionPage(_selectedAge, (age) {
                          setState(() {
                            _selectedAge = age;
                          });
                        });
                      if (index == questions.length + 2)
                        return SubjectSelectionPage(_subject, (subject) {
                          setState(() {
                            _subject = subject;
                          });
                        });
                      if (index == questions.length + 3)
                        return buildQuestionChoicePage(questions[0]);
                      if (index == questions.length + 4)
                        return ReminderSelectionPage(_reminderTime, (time) {
                          setState(() {
                            _reminderTime = time;
                          });
                        });
                      if (index == questions.length + 5)
                        return LoadingScreen(_progress);

                      return Container(); // fallback
                    },
                  ),
                ),
                if (_currentPage > 0)
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: questions.length + 6,
                    effect: WormEffect(
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                      activeDotColor: Colors.teal,
                    ),
                  ),
                SizedBox(height: 20),
                if (_currentPage > 0)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      width: double.infinity, // Make the button wider
                      child: ElevatedButton(
                        onPressed: () {
                          if (_currentPage < questions.length + 5) {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          } else {
                         /*   Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SuccessScreen()),
                            );*/
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                        ),
                        child: Text(
                          _currentPage < questions.length + 5
                              ? "Continue"
                              : "Finish",
                          style: GoogleFonts.poppins( // Apply Poppins font
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWelcomePage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome!",
            style: GoogleFonts.poppins( // Use Poppins for the title
              textStyle: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1A2136),
              ),
              //textAlign: TextAlign.center, // Center the text
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Find what you are looking for",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins( // Use Poppins for the subtitle
              textStyle: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
          SizedBox(height: 40),
          CustomButton(
            text: "Personalize Your Account",
            onPressed: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
            backgroundColor: Colors.greenAccent,
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget buildQuestionChoicePage(Map<String, dynamic> question) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center text
        children: [
          Text(
            question['title'],
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            textAlign: TextAlign.center, // Center the text
          ),
          SizedBox(height: 8),
          Text(
            question['subtitle'],
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            textAlign: TextAlign.center, // Center the text
          ),
          SizedBox(height: 24),
          Column(
            children: question['options'].map<Widget>((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: ListTile(
                    title: Text(option,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 16),
                        )),
                    trailing: question['selected'] == option
                        ? Icon(Icons.check, color: Colors.greenAccent)
                        : null,
                    onTap: () {
                      setState(() {
                        question['selected'] = option;
                      });
                    },
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
