

import 'package:flutter/material.dart';
import 'package:studyapp/comp/set_card.dart';
/*
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Tarihler için liste oluşturma
  List<DateTime> _dates = [];

  @override
  void initState() {
    super.initState();
    _generateDates();
  }

  // Bugünden başlayarak 5 gün oluştur
  void _generateDates() {
    _dates = List.generate(5, (index) {
      return DateTime.now().add(Duration(days: index));
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Eğer farklı sayfalar arasında geçiş yapacaksan, burada uygun rotayı belirleyebilirsin
      // Örnek:
      // if (index == 0) {
      //   Navigator.pushReplacementNamed(context, '/home');
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF5F5F5),
        centerTitle: true,
        title: Text('Explore', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Premium Banner
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF1A2136),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upgrade Premium!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Enjoy all the benefits',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              // Upgrade butonu tıklama işlemi buraya gelecek
                              print("Upgrade button pressed");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent, // Buton rengi
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              minimumSize:
                                  Size(80, 36), // Butonun minimum boyutu
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36),
                              ),
                            ),
                            child: Text(
                              'Upgrade',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13), // Yazı boyutunu küçült
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),

              // Recent Study Sets
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Study Sets',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('View All'),
                  )
                ],
              ),
              SizedBox(height: 16),

              // Study Set Cards
            StudySetCard(
                  title: 'Political Science',
                  flashcards: 194,
                  explanations: 126,
                  exercises: 109,
                  author: 'Mr. Carter',
                  color: Colors.greenAccent,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),

              SizedBox(height: 24),

              // Study Plan
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _dates.map((date) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '${date.day}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(_getDayOfWeek(date)),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 16),

              // Your study plan section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your study plan today (0/5)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Study Plan Steps with icons and dashed lines
                  Column(
                    children: List.generate(2, (index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Dışarıda yer alan tik işareti ve kesik çizgi
                          Column(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Color(0xFF1A2136), width: 2),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(Icons.check,
                                      size: 12, color: Color(0xFF1A2136)),
                                ),
                              ),
                              if (index != 1) // Son elemanda çizgi olmayacak
                                Container(
                                  height: 50,
                                  width: 2,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: Color(0xFF1A2136).withOpacity(0.5),
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                      bottom: BorderSide(
                                        color: Colors.transparent,
                                        width: 0,
                                      ),
                                    ),
                                    // Kesik çizgi
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(width: 12),
                          // Kutunun içindeki yazı ve kitap ikonu
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 12),
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 2), // Shadow position
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.book, color: Color(0xFF1A2136)),
                                  Expanded(
                                    child: Text(
                                      'Read the explanation in "Genetics"',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
                ],
          ),
        ),
      ),
    );
  }

  // Haftanın gününü alır
  String _getDayOfWeek(DateTime date) {
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[date.weekday - 1];
  }
}*/
import 'package:flutter/material.dart';
import 'package:studyapp/comp/set_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Tarihler için liste oluşturma
  List<DateTime> _dates = [];

  @override
  void initState() {
    super.initState();
    _generateDates();
  }

  // Bugünden başlayarak 5 gün oluştur
  void _generateDates() {
    _dates = List.generate(5, (index) {
      return DateTime.now().add(Duration(days: index));
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.transparent,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipPath(
                clipper: OvalBottomClipper(),
                child: Container(
                  color: Color(0xFF1A2136),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('study app', style: TextStyle(color: Colors.white, fontSize: 24)),
                            ElevatedButton(
                              onPressed: () {
                                // Action for free trial button
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.greenAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              child: Text('Upgrade'),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'search',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.search, color: Colors.black),
                            suffixIcon: Icon(Icons.camera_alt, color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Recent Study Sets
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Study Sets',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('View All'),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      // Study Set Cards
                      StudySetCard(
                        title: 'Political Science',
                        flashcards: 194,
                        explanations: 126,
                        exercises: 109,
                        author: 'Mr. Carter',
                        color: Colors.greenAccent,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                      ),
                      SizedBox(height: 24),
                      // Study Plan
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: _dates.map((date) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    '${date.day}',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(_getDayOfWeek(date)),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Your study plan section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your study plan today (0/5)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 16),
                          // Study Plan Steps with icons and dashed lines
                          Column(
                            children: List.generate(2, (index) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Color(0xFF1A2136), width: 2),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Icon(Icons.check,
                                              size: 12, color: Color(0xFF1A2136)),
                                        ),
                                      ),
                                      if (index != 1)
                                        Container(
                                          height: 50,
                                          width: 2,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                color: Color(0xFF1A2136)
                                                    .withOpacity(0.5),
                                                width: 1,
                                              ),
                                              bottom: BorderSide(
                                                color: Colors.transparent,
                                                width: 0,
                                              ),
                                            ),
                                            borderRadius: BorderRadius.circular(2),
                                          ),
                                        ),
                                    ],
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 12),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 12),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.book,
                                              color: Color(0xFF1A2136)),
                                          Expanded(
                                            child: Text(
                                              'Read the explanation in "Genetics"',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Haftanın gününü alır
  String _getDayOfWeek(DateTime date) {
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[date.weekday - 1];
  }
}

class OvalBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 30);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height);
    var secondControlPoint = Offset(3 * size.width / 4, size.height);
    var secondEndPoint = Offset(size.width, size.height - 30);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
