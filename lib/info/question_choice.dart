import 'package:flutter/material.dart';

class QuestionChoicePage extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> options;
  final String selectedOption;
  final ValueChanged<String> onOptionSelected;

  QuestionChoicePage({
    required this.title,
    required this.subtitle,
    required this.options,
    required this.selectedOption,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(options[index]),
                  trailing: selectedOption == options[index]
                      ? Icon(Icons.check, color: Colors.teal)
                      : null,
                  onTap: () {
                    onOptionSelected(options[index]);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  tileColor: selectedOption == options[index]
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
