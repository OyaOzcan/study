import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomNavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.black,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            backgroundColor: Colors.black,
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_outlined),
            backgroundColor: Colors.black,
            label: "Scanner",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            backgroundColor: Colors.black,
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            backgroundColor: Colors.black,
            label: 'Account',
          ),
        ]);
  }
}
