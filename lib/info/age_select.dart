import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AgeSelectionPage extends StatelessWidget {
  final int selectedAge;
  final ValueChanged<int> onAgeSelected;

  AgeSelectionPage(this.selectedAge, this.onAgeSelected);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "How old are you?",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Expanded(
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(
                initialItem: selectedAge - 17,
              ),
              itemExtent: 40.0,
              onSelectedItemChanged: (index) {
                onAgeSelected(index + 17);
              },
              children: List<Widget>.generate(100, (int index) {
                return Center(
                  child: Text(
                    (index + 17).toString(),
                    style: TextStyle(fontSize: 24),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
