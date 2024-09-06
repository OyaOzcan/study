import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:studyapp/model/flash_card_manual.dart';

class WritePage extends StatefulWidget {
  final String deckName;
  final List<FlashCard> flashCards;

  WritePage({required this.deckName, required this.flashCards});

  @override
  _WritePageState createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  int currentIndex = 0;
  int correctAnswers = 0;
  bool isAnswerChecked = false;
  bool isCorrect = false;
  List<bool> answerResults = [];
  TextEditingController answerController = TextEditingController();

  void checkAnswer() {
    setState(() {
      isAnswerChecked = true;
      String correctAnswer = widget.flashCards[currentIndex].back.trim().toLowerCase();
      String userAnswer = answerController.text.trim().toLowerCase();
      if (userAnswer == correctAnswer) {
        isCorrect = true;
        correctAnswers++;
        answerResults.add(true);
      } else {
        isCorrect = false;
        answerResults.add(false);
      }
    });

    // Doğru ya da yanlış cevap verildiğinde otomatik olarak sonraki soruya geçiş
    Future.delayed(Duration(seconds: 1), () {
      nextCard();
    });
  }

  void showCorrectAnswer() {
    setState(() {
      answerController.text = widget.flashCards[currentIndex].back;
      isAnswerChecked = true;
      isCorrect = false;
      answerResults.add(false);
    });

    // Cevap gösterildikten sonra otomatik olarak sonraki soruya geçiş
    Future.delayed(Duration(seconds: 2), () {
      nextCard();
    });
  }

  void nextCard() {
    if (currentIndex < widget.flashCards.length - 1) {
      setState(() {
        currentIndex++;
        isAnswerChecked = false;
        isCorrect = false;
        answerController.clear();
      });
    } else {
      // Tüm sorular bittiğinde sonucu göster
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WriteResultPage(
            correctAnswers: correctAnswers,
            totalQuestions: widget.flashCards.length,
            answerResults: answerResults,
            flashCards: widget.flashCards,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.deckName),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // İlerleme Çubuğu
            LinearProgressIndicator(
              value: (currentIndex + 1) / widget.flashCards.length,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
            SizedBox(height: 16),
            Text(
              widget.flashCards[currentIndex].front,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Center( // Kartı ortalamak için Center widget'ı eklendi
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8, // Kart genişliği
                  height: 150, // Kart yüksekliği küçültüldü
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: isAnswerChecked
                        ? (isCorrect ? Colors.green[100] : Colors.red[100])
                        : Colors.blue[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: answerController,
                    decoration: InputDecoration(
                      hintText: 'Cevabınızı girin',
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: showCorrectAnswer,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text('Bilmiyorum'),
                ),
                ElevatedButton(
                  onPressed: checkAnswer,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text('Kontrol Et'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WriteResultPage extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final List<bool> answerResults;
  final List<FlashCard> flashCards;

  WriteResultPage({
    required this.correctAnswers,
    required this.totalQuestions,
    required this.answerResults,
    required this.flashCards,
  });

  @override
  Widget build(BuildContext context) {
    double percentage = correctAnswers / totalQuestions;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sonuçlar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: percentage,
                    strokeWidth: 10.0,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  ),
                  Text(
                    "${(percentage * 100).toInt()}%",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: totalQuestions,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(flashCards[index].front),
                    trailing: Icon(
                      answerResults[index] ? Icons.check_circle : Icons.cancel,
                      color: answerResults[index] ? Colors.green : Colors.red,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/')); // Ana sayfaya dön
              },
              child: Text('Destelerine Dön'),
            ),
          ],
        ),
      ),
    );
  }
}
