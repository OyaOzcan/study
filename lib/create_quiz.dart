import 'package:flutter/material.dart';


class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final TextEditingController questionController = TextEditingController();
  final List<TextEditingController> optionControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  int? selectedOption;

  void _saveQuestion() {
    // Handle saving logic here
    String question = questionController.text;
    List<String> options = optionControllers.map((controller) => controller.text).toList();
    int? correctAnswer = selectedOption;

    if (question.isNotEmpty && options.every((option) => option.isNotEmpty) && correctAnswer != null) {
      // Save the question data
      print('Question: $question');
      print('Options: $options');
      print('Correct Answer: Option ${correctAnswer + 1}');
    } else {
      // Show error
      print('Please fill in all fields and select the correct answer');
    }
  }

  void _cancel() {
    // Handle cancel logic, for example, clearing fields
    questionController.clear();
    for (var controller in optionControllers) {
      controller.clear();
    }
    setState(() {
      selectedOption = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Exercises'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Question 1',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextField(
                controller: questionController,
                decoration: InputDecoration(
                  labelText: 'Enter the question',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                maxLines: 2,
              ),
              SizedBox(height: 16),
              ...List.generate(optionControllers.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: ListTile(
                    title: TextField(
                      controller: optionControllers[index],
                      decoration: InputDecoration(
                        labelText: 'Option ${String.fromCharCode(65 + index)}',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedOption = index;
                        });
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedOption == index ? Colors.green : Colors.grey,
                            width: 2,
                          ),
                          color: selectedOption == index ? Colors.green : Colors.transparent,
                        ),
                        child: selectedOption == index
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              )
                            : null,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                  ),
                );
              }),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
                    onPressed: _saveQuestion,
                    child: Text('Save',style: TextStyle(color: Colors.white)),
                  ),
                  ElevatedButton(
                    onPressed: _cancel,
                    child: Text('Cancel', style: TextStyle(color: Colors.white),),
                       style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
