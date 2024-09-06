import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  final String text;

  TextPage({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Text"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(text, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
