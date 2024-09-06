import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ReminderSelectionPage extends StatelessWidget {
  final String reminderTime;
  final ValueChanged<String> onReminderSelected;

  ReminderSelectionPage(this.reminderTime, this.onReminderSelected);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Set your study reminder",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "Choose a time for your daily study reminder.",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 16),
          Expanded(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.time,
              initialDateTime: DateTime(2023, 1, 1, 20, 0),
              onDateTimeChanged: (DateTime newDateTime) {
                onReminderSelected(
                    "${newDateTime.hour}:${newDateTime.minute.toString().padLeft(2, '0')}");
              },
              use24hFormat: false,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Reminder set for $reminderTime PM",
            style: TextStyle(fontSize: 24, color: Colors.teal),
          ),
        ],
      ),
    );
  }
}
