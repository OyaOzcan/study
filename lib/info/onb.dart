import 'package:flutter/material.dart';
import 'package:studyapp/comp/button.dart';
import 'package:studyapp/info/steps_dart';


class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top Container with Rounded Bottom for the header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 320,
              decoration: const BoxDecoration(
                color: Color(0xFF1A2136),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
          ),
          // Icon positioned at the bottom of the rounded container
          Positioned(
            top: 270,
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
          // Welcome Text and Buttons Below
          Positioned(
            top: 350,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  "Welcome!",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A2136),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Text(
                    "Would you like us to create a personalized study plan for you?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                // Personalize Button
                CustomButton(
                  text: "Personalize Your Account",
                  onPressed: () {
                    // Navigate to the OnboardingStepsPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OnboardingStepsPage()),
                    );
                  },
                  backgroundColor: Colors.greenAccent,
                  textColor: Colors.black,
                ),
                SizedBox(height: 20),
                // Skip Button
                Container(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: () {
                      // Handle skip action
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue[900]!),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
