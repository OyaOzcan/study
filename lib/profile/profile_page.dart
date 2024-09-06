import 'package:flutter/material.dart';
import 'package:studyapp/profile/app_apparance.dart';
import 'package:studyapp/profile/personel_%C4%B1nfo_page.dart';
import 'package:studyapp/profile/preferences_page.dart';
import 'package:studyapp/profile/scan_history_page.dart';
import 'package:studyapp/profile/security_page.dart'; // Account & Security sayfasının yolu

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xfff5f5f5), // Sayfa arka plan rengi
        appBar: AppBar(
          title: Text('Account', style: TextStyle(color: Colors.black)),
          backgroundColor: Color(0xfff5f5f5), // AppBar arka plan rengi
          elevation: 0, // Gölgeyi kaldırıyoruz
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              color: Colors.black, // İkon rengini siyah yapıyoruz
              onPressed: () {
                // Daha fazla işlem menüsü
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Upgrade Plan Kartı
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildUpgradeCard(),
              ),

              // Kullanıcı Bilgileri Kartı
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildUserInfoCard(context),
              ),

              // Diğer Menü Öğeleri
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildMenuCard([
                  _buildMenuTile(Icons.history, 'Scan History', context),
                  _buildMenuTile(Icons.settings, 'Preferences', context),
                ]),
              ),

              // Diğer Menü Öğeleri Grup 2
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildMenuCard([
                  _buildMenuTile(Icons.security, 'Account & Security', context),
                  _buildMenuTile(Icons.visibility, 'App Appearance', context),
                  _buildMenuTile(
                      Icons.group_add, 'Invite Your Friends', context),
                  _buildMenuTile(Icons.star, 'Rate us', context),
                ]),
              ),

              // Logout Butonu
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.logout, color: Colors.red),
                    title: Text('Logout', style: TextStyle(color: Colors.red)),
                    onTap: () {
                      _showLogoutConfirmation(
                          context); // Logout işlemi için modal açılıyor
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Logout onayı için modal bottom sheet
  void _showLogoutConfirmation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(16.0),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Logout',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Sure you want to log out?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Cancel butonu
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Cancel işlemi
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xff1aa7ec),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xffe0f7f8),
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Butonlar arasındaki boşluk

                  // Yes, Logout butonu
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Logout işlemi burada yapılacak
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Yes, Logout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff1aa7ec),
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Upgrade Plan Kartı
  Widget _buildUpgradeCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.greenAccent,
      child: ListTile(
        title: Text(
          'Upgrade Plan Now!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Enjoy all the benefits and explore more possibilities',
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  // Kullanıcı Bilgileri Kartı
  Widget _buildUserInfoCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: Colors.white,
      //shape: RoundedRectangleBorder(
       // borderRadius: BorderRadius.circular(15),
      //),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://example.com/user_profile_image.png'), // Profil resmi buradan çekilebilir
          radius: 30,
        ),
        title: Text('Andrew Ainsley'),
        subtitle: Text(
          'andrew.ainsley@yourdomain.com',
          style: TextStyle(fontSize: 12),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Profil tıklandığında kişisel bilgi sayfasına yönlendirme
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PersonalInfoPage()),
          );
        },
      ),
    );
  }

  // Menü Öğeleri Kartı
  Widget _buildMenuCard(List<Widget> menuItems) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: menuItems,
      ),
    );
  }

  // Menü Öğesi
  Widget _buildMenuTile(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Menü öğesine tıklandığında yapılacak işlem
        if (title == 'Scan History') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScanHistoryPage()),
          );
        } else if (title == 'Preferences') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PreferencesPage()),
          );
        } else if (title == 'Account & Security') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AccountSecurityPage()),
          );
        } else if (title == 'App Appearance') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AppAppearancePage()),
          );
        }
        // Diğer menüler için benzer şekilde yönlendirme yapılabilir
      },
    );
  }
}
