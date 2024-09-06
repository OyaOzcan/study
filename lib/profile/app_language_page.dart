import 'package:flutter/material.dart';

class LanguageSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text('App Language', style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xfff5f5f5),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Sayfanın genel padding'i
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Kartları başa hizala
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Kartları genişliğe yay
          children: [
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize
                    .min, // Kartın yüksekliği içeriğe göre ayarlanır
                children: [
                  _buildLanguageTile(context, 'English', true),
                  Divider(),
                  _buildLanguageTile(context, 'Turkish', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageTile(
      BuildContext context, String language, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0, vertical: 4.0), // Daha sıkı padding
      child: ListTile(
        title: Text(language, style: TextStyle(fontSize: 16)),
        trailing: isSelected ? Icon(Icons.check, color: Colors.blue) : null,
        onTap: () {
          // Dil seçimi yapılabilir
        },
      ),
    );
  }
}
