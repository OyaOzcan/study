import 'package:flutter/material.dart';

class SubjectSelectionPage extends StatelessWidget {
  final String selectedSubject;
  final ValueChanged<String> onSubjectSelected;

  SubjectSelectionPage(this.selectedSubject, this.onSubjectSelected);

  @override
  Widget build(BuildContext context) {
    List<String> subjects = [
      'Accounting',
      'Biology',
      'Chemistry',
      'Computer Science',
      'Economics',
      'Engineering',
      'Physics',
      'Mathematics',
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select your subject",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "Choose your subject of study from the list.",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(subjects[index]),
                  trailing: selectedSubject == subjects[index]
                      ? Icon(Icons.check, color: Colors.teal)
                      : null,
                  onTap: () {
                    onSubjectSelected(subjects[index]);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  tileColor: selectedSubject == subjects[index]
                      ? Colors.teal.shade50
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
