import 'package:flutter/material.dart';
import 'package:studyapp/create_flashcard.dart';
import 'package:studyapp/create_quiz.dart';
import 'package:studyapp/explore_page/explore_page.dart';
import 'package:studyapp/home_page.dart';
import 'package:studyapp/library_page.dart';
import 'package:studyapp/profile/profile_page.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ExplorePage(),
    LibraryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1A2136),  // Sadece FAB rengi farklı olacak
        onPressed: () {
          _showAddNewDialog(context);  // FloatingActionButton tıklanınca modal açılır
        },
        child: Icon(
          Icons.add,
          color: Colors.white,  // İkon rengi beyaz
        ),
        shape: CircleBorder(),  // Tamamen yuvarlak
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,  // Ortada yerleştirme
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Beyaz arka plan
        type: BottomNavigationBarType.fixed, // İkonlar arasında padding olmaması için
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _currentIndex == 0 ? Color(0xFF1A2136) : Colors.grey, // Tıklanınca renk değişimi
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
              color: _currentIndex == 1 ? Color(0xFF1A2136) : Colors.grey, // Tıklanınca renk değişimi
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_books,
              color: _currentIndex == 2 ? Color(0xFF1A2136) : Colors.grey, // Tıklanınca renk değişimi
            ),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: _currentIndex == 3 ? Color(0xFF1A2136) : Colors.grey, // Tıklanınca renk değişimi
            ),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  void _showAddNewDialog(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true, // Modalın daha büyük bir kısmını kaplamasını sağlar
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Add New',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Başlık rengi siyah
                        ),
                      ),
                    ),
                    Divider(),
                    _buildSection('Flashcards', [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildCustomButton(
                            context,
                            Icons.add,
                            'Create Manually',
                            Colors.black,
                            Colors.white,
                            onPressed: () {
                              Navigator.pop(context); // Modalı kapatır
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreateFlashcardsPage(),
                                ),
                              );
                            },
                          ),
                          _buildCustomButton(
                            context,
                            Icons.auto_awesome,
                            'Generate with AI',
                            Colors.deepPurple,
                            Colors.white,
                          ),
                        ],
                      ),
                    ]),
                    _buildSection('Explanations', [
                      _buildCustomButton(
                        context,
                        Icons.upload_file,
                        'Upload Files',
                        Colors.black,
                        Colors.white,
                      ),
                    ]),
                    _buildSection('Exercises', [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           _buildCustomButton(
  context,
  Icons.add,
  'Create Manually',
  Colors.black,
  Colors.white,
  onPressed: () {
    Navigator.pop(context); // Modalı kapatır
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPage(), // Navigating to QuizPage
      ),
    );
  },
),
                          _buildCustomButton(
                            context,
                            Icons.auto_awesome,
                            'Generate with AI',
                            Colors.deepPurple,
                            Colors.white,
                          ),
                        ],
                      ),
                    ]),
                    
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSection(String title, List<Widget> buttons) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black), // Bölüm başlığı rengi siyah
        ),
        SizedBox(height: 8),
        ...buttons,
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildCustomButton(
      BuildContext context, IconData icon, String text, Color iconColor, Color backgroundColor,
      {VoidCallback? onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: OutlinedButton.icon(
        onPressed: onPressed ?? () => Navigator.pop(context),
        icon: Icon(icon, color: iconColor), // İkon rengi
        label: Text(
          text,
          style: TextStyle(color: iconColor), // Yazı rengi ikon rengine uyumlu
        ),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          backgroundColor: backgroundColor, // Butonun arka plan rengi
          side: BorderSide(color: Colors.grey.shade300, width: 2), // Buton çerçeve rengi ve kalınlığı
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
