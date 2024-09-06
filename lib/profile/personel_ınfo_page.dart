import 'package:flutter/material.dart';

class PersonalInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sayfa arka plan rengini beyaz yapıyoruz
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black, // Geri tuşunun rengini siyah yapıyoruz
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Personal Info',
          style:
              TextStyle(color: Colors.black), // Başlık rengini siyah yapıyoruz
        ),
        backgroundColor: Colors.white, // AppBar arka planını beyaz yapıyoruz
        elevation: 0, // AppBar'ın gölgesini kaldırıyoruz
        iconTheme:
            IconThemeData(color: Colors.black), // İkon rengini siyah yapıyoruz
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile picture with edit button
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://example.com/user_profile_image.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Full Name
              buildInfoField('Full Name', 'Andrew Ainsley'),

              // Email
              buildInfoField('Email', 'andrew.ainsley@yourdomain.com',
                  icon: Icons.email),

              // Phone Number
              buildInfoField('Phone Number', '+1 111 467 378 399',
                  icon: Icons.phone),

              // Gender
              buildInfoField('Gender', 'Male', isDropdown: true),

              // Date of Birth
              buildInfoField('Date of Birth', '12-27-1995',
                  icon: Icons.calendar_today),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoField(String label, String value,
      {IconData? icon, bool isDropdown = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              color: Color(0xfff5f5f5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                if (icon != null) Icon(icon, color: Colors.black54),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                if (isDropdown)
                  Icon(Icons.arrow_drop_down, color: Colors.black54),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
