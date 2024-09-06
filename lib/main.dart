import 'package:flutter/material.dart';
import 'package:studyapp/create_quiz.dart';
import 'package:studyapp/info/onb.dart';
import 'package:studyapp/library_page.dart';
import 'package:studyapp/main_page.dart';
import 'package:studyapp/manuel_create_set/create_set.dart';
import 'package:studyapp/manuel_create_set/manual_sets.dart';
import 'package:studyapp/register/leafboard_screen.dart';
import 'package:studyapp/register/login_page.dart';
import 'package:studyapp/register/register_page.dart';
import 'package:studyapp/register/splash_screen.dart';
import 'package:studyapp/set_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
      ),
    //  home: QuizPage(),
    // home: LoginPage(),
   //  home: IntroPage(),
   //home: OnboardingScreen(),
     home:SplashScreen(),
   //home: QuizPage(),
     // home: MainPage(),
      //home: StudyPage(),
     // home:LibraryPage(),
           // home: ExplorePage(),
    );
  }
}
 