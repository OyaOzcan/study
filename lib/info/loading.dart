import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final double progress;

  LoadingScreen(this.progress);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Preparing a personalized page for you...",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            "Please wait...",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 24),
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 6.0,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
          ),
          SizedBox(height: 16),
          Text(
            "${(progress * 100).toInt()}%",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            "This might take a few moments. Get ready for an amazing study experience!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
