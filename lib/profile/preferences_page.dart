import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PreferencesPage(),
    );
  }
}

class PreferencesPage extends StatefulWidget {
  @override
  _PreferencesPageState createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  bool isReminderOn = true;
  double ringtoneVolume = 0.5;
  bool isVibrationOn = false;
  TimeOfDay reminderTime = TimeOfDay(hour: 20, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Preferences',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xfff5f5f5),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      backgroundColor: Color(0xfff5f5f5), // Arka plan rengini buraya ekledik
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwitchListTile(
                    title: Text(
                      'Daily Study Reminder',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: isReminderOn,
                    onChanged: (bool value) {
                      setState(() {
                        isReminderOn = value;
                      });
                    },
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Reminder Time'),
                        Text('${reminderTime.format(context)}'),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () async {
                      final TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: reminderTime,
                      );
                      if (picked != null && picked != reminderTime) {
                        setState(() {
                          reminderTime = picked;
                        });
                      }
                    },
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ringtone'),
                        Text('Lollipop'),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Implement ringtone selection logic here
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.volume_mute, color: Colors.grey),
                        Expanded(
                          child: Slider(
                            value: ringtoneVolume,
                            activeColor: Colors.blue,
                            onChanged: (double value) {
                              setState(() {
                                ringtoneVolume = value;
                              });
                            },
                          ),
                        ),
                        Icon(Icons.volume_up, color: Colors.grey),
                      ],
                    ),
                  ),
                  SwitchListTile(
                    title: Text(
                      'Vibration',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    value: isVibrationOn,
                    onChanged: (bool value) {
                      setState(() {
                        isVibrationOn = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          // Second card for First Day of Week, Time Format, and Day Reset Time

          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('First Day of Week'),
                        Text('Monday'),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Implement first day of week selection logic
                    },
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Time Format'),
                        Text('System Default'),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Implement time format selection logic
                    },
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Day Reset Time'),
                        Text('00:00 AM'),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Implement day reset time logic
                    },
                  ),
                ],
              ),
            ),
          ),

          // Third card for Restart All Progress and Clear Cache

          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Restart All Progress'),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    onTap: () {
                      // Implement restart progress logic
                    },
                  ),
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Clear Cache'),
                        Text(
                          '45.8 MB',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Implement clear cache logic
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
