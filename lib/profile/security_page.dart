import 'package:flutter/material.dart';

void main() {
  runApp(AccountSecurityPage());
}

class AccountSecurityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: AppBar(
          title:
              Text('Account & Security', style: TextStyle(color: Colors.black)),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Biometric ID, Face ID, SMS Authenticator, Google Authenticator Switch'leri
                    _buildSwitchTile('Biometric ID', false),
                    _buildSwitchTile('Face ID', false),
                    _buildSwitchTile('SMS Authenticator', false),
                    _buildSwitchTile('Google Authenticator', false),

                    // Change Password, Device Management, Deactivate Account ListTiles
                    _buildListTile(
                        context, 'Change Password', Icons.arrow_forward_ios),
                    _buildListTile(
                        context, 'Device Management', Icons.arrow_forward_ios,
                        subtitle:
                            'Manage your account on the various devices you own.'),
                    _buildListTile(
                        context, 'Deactivate Account', Icons.arrow_forward_ios,
                        subtitle:
                            'Temporarily deactivate your account. Easily reactivate when you\'re ready.'),

                    // Delete Account (Özel Stil)
                    _buildDeleteAccountTile(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // SwitchTile öğesi
  Widget _buildSwitchTile(String title, bool value) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: (bool newValue) {
        // Switch işlemi
      },
    );
  }

  // Normal ListTile öğesi
  Widget _buildListTile(BuildContext context, String title, IconData icon,
      {String? subtitle}) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: Icon(icon),
      onTap: () {
        // Her tıklama için özel yönlendirme yapılabilir
      },
    );
  }

  // Delete Account için özel ListTile stili
  Widget _buildDeleteAccountTile() {
    return ListTile(
      title: Text(
        'Delete Account',
        style: TextStyle(color: Colors.red),
      ),
      subtitle: Text(
        'Permanently remove your account and data. Proceed with caution.',
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.red),
      onTap: () {
        // Delete account işlemi
      },
    );
  }
}
