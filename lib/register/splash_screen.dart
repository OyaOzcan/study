import 'package:flutter/material.dart';
import 'package:studyapp/main.dart';
import 'package:studyapp/main_page.dart';
import 'package:studyapp/register/leafboard_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // _checkLoginStatus() fonksiyonunu build işlemi tamamlandıktan sonra çalıştırır.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLoginStatus();
    });
  }

  void _checkLoginStatus() {
    // Burada kullanıcı durumu kontrol edilecek.
    // Örnek: Varsayılan olarak giriş yapılmamış sayılacak
    bool isLoggedIn = false;

    if (isLoggedIn) {
      // Kullanıcı giriş yapmışsa, HomeScreen'e yönlendir
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } else {
      // Kullanıcı giriş yapmamışsa, giriş ekranına yönlendir
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
