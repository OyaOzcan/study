import 'package:flutter/material.dart';

class CreateSet extends StatefulWidget {
  @override
  _CreateSetState createState() => _CreateSetState();
}

class _CreateSetState extends State<CreateSet> {
  final TextEditingController setNameController = TextEditingController();
  final TextEditingController frontController = TextEditingController();
  final TextEditingController backController = TextEditingController();
  bool isFlipped = false;
  List<Map<String, String>> cards = [];

  void flipCard() {
    setState(() {
      isFlipped = !isFlipped;
    });
  }

  void saveCard() {
    if (frontController.text.isNotEmpty && backController.text.isNotEmpty) {
      setState(() {
        cards.add({'front': frontController.text, 'back': backController.text});
        frontController.clear();
        backController.clear();
        isFlipped = false;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Set'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: setNameController,
              decoration: InputDecoration(
                hintText: 'Enter Set Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            if (!isFlipped)
              CardInputField(
                controller: frontController,
                label: 'Enter text for the front of the card',
                onSave: flipCard,
              )
            else
              CardInputField(
                controller: backController,
                label: 'Enter text for the back of the card',
                onSave: saveCard,
              ),
            SizedBox(height: 20),
            Text(
              'Added Cards',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Card(
                      child: ListTile(
                        title: Text(cards[index]['front']!),
                        subtitle: Text(cards[index]['back']!),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: (){},
                child: Text('Save Set'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final VoidCallback onSave;

  const CardInputField({
    required this.controller,
    required this.label,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenWidth, // Kare olması için height, screenWidth ile eşitlendi
      width: screenWidth,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  maxLines: null,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    hintText: label,
                    border: InputBorder.none,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      controller.clear();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.check_circle),
                    onPressed: onSave,
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
