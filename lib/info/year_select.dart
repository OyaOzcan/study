import 'package:flutter/material.dart';

class YearSelectionPage extends StatelessWidget {
  final String selectedYear;
  final ValueChanged<String> onYearSelected;

  YearSelectionPage(this.selectedYear, this.onYearSelected);

  @override
  Widget build(BuildContext context) {
    List<String> years = ['School', 'University', 'College', 'Online Course', 'Other'];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What year are you in?",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "Let us know your current year of study.",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: years.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(years[index]),
                  trailing: selectedYear == years[index]
                      ? Icon(Icons.check, color: Colors.teal)
                      : null,
                  onTap: () {
                    onYearSelected(years[index]);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  tileColor: selectedYear == years[index]
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
