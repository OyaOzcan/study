// home_page.dart
import 'package:flutter/material.dart';
import 'package:studyapp/profile/navbar.dart';

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
                  color: const Color.fromARGB(255, 64, 189, 203),
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
                              backgroundColor: Colors.white, // Buton rengi
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
              Container(
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Sol kenar şeridi
                      Container(
                        width: 8,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Cell Biology',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.green, width: 3),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '58%',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              '45 flashcards • 12 explanations • 20 exercises',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Icon(Icons.lock_outline, color: Colors.grey),
                                Spacer(),
                                Icon(Icons.more_vert, color: Colors.grey),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
                                      Border.all(color: Colors.blue, width: 2),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(Icons.check,
                                      size: 12, color: Colors.blue),
                                ),
                              ),
                              if (index != 1) // Son elemanda çizgi olmayacak
                                Container(
                                  height: 50,
                                  width: 2,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.blue.withOpacity(0.5),
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
                                  Icon(Icons.book, color: Colors.blue),
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
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  // Haftanın gününü alır
  String _getDayOfWeek(DateTime date) {
    List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[date.weekday - 1];
  }
}
