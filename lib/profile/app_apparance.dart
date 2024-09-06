import 'package:flutter/material.dart';

void main() {
  runApp(AppAppearancePage());
}

class AppAppearancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: AppBar(
          title: Text('App Appearance', style: TextStyle(color: Colors.black)),
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
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity, // Kartı ekranın genişliğine yaymak için
            height: 130.0, // Kartın yüksekliği
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Theme'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Light',
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    onTap: () {
                      _showThemeSelectionSheet(context);
                    },
                  ),
                  ListTile(
                    title: Text('App Language'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('English', style: TextStyle(fontSize: 16)),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    onTap: () {
                      // Dil seçim sayfasına yönlendirme yapılabilir.
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Tema seçim menüsünü açan fonksiyon
  void _showThemeSelectionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) {
        return ThemeSelectionDialog();
      },
    );
  }
}

class ThemeSelectionDialog extends StatefulWidget {
  @override
  _ThemeSelectionDialogState createState() => _ThemeSelectionDialogState();
}

class _ThemeSelectionDialogState extends State<ThemeSelectionDialog> {
  String selectedTheme = "Light"; // Varsayılan olarak "Light" seçili

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Choose Theme',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),

          // Sistem varsayılanı seçeneği
          _buildCustomRadioTile(
            'System Default',
            'System Default',
            selectedTheme,
            (value) {
              setState(() {
                selectedTheme = value!;
              });
            },
          ),

          // Açık tema seçeneği
          _buildCustomRadioTile(
            'Light',
            'Light',
            selectedTheme,
            (value) {
              setState(() {
                selectedTheme = value!;
              });
            },
          ),

          // Koyu tema seçeneği
          _buildCustomRadioTile(
            'Dark',
            'Dark',
            selectedTheme,
            (value) {
              setState(() {
                selectedTheme = value!;
              });
            },
          ),

          SizedBox(height: 10.0), // Butonlar ile seçenekler arasındaki boşluk
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context); // İptal butonu
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      backgroundColor:
                          Color(0xffe0f7f8), // Cancel butonunun arka plan rengi
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // Köşeleri yuvarlatma
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color(0xff1aa7ec), // Yazı rengi
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0), // İki buton arasındaki boşluk
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          context); // OK butonuna tıklayınca işlemi yap
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      backgroundColor:
                          Color(0xff1aa7ec), // OK butonunun arka plan rengi
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // Köşeleri yuvarlatma
                      ),
                    ),
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.white, // Yazı rengi
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // RadioListTile için özelleştirilmiş yapı
  Widget _buildCustomRadioTile(String title, String value, String groupValue,
      ValueChanged<String?> onChanged) {
    return ListTile(
      leading: Radio<String>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: Color(0xff1aa7ec), // Radio butonunun rengi
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
