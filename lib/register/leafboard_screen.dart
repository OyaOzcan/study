import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studyapp/register/login_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
          Positioned(
            top:
                300, // Beyaz yuvarlağın yerine yaprağı eklemek için konum ayarı
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
          Positioned(
            top: 420,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "Leafboard",
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A2136),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "A platform built for a new way of working",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color(0xFF1A2136),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginPage()
                        //LeafboardLoginScreen(),
                        // HomeScreen()

                        ),
                  );
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
                child: const Text(
                  "Get Started for Free ->",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
