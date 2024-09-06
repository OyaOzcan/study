import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:studyapp/model/flash_card_manual.dart';

class LearnPage extends StatefulWidget {
  final String deckName;
  final List<FlashCard> flashCards;

  LearnPage({required this.deckName, required this.flashCards});

  @override
  _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> with TickerProviderStateMixin {
  int _currentIndex = 0;
  Offset _cardOffset = Offset.zero;
  double _cardRotation = 0;
  double _opacity = 0;
  IconData? _swipeIcon;
  int _correctCount = 0;
  int _wrongCount = 0;

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _cardOffset += details.delta;
      _cardRotation = _cardOffset.dx / 300;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_cardOffset.dx > 150) {
      _swipeRight();
    } else if (_cardOffset.dx < -150) {
      _swipeLeft();
    } else {
      setState(() {
        _cardOffset = Offset.zero;
        _cardRotation = 0;
      });
    }
  }

  void _swipeRight() {
    setState(() {
      _swipeIcon = Icons.check;
      _opacity = 1.0;
      _correctCount++;
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          _opacity = 0;
          _swipeIcon = null;
          if (_currentIndex < widget.flashCards.length - 1) {
            _currentIndex++;
          } else {
            _showResult();
          }
          _cardOffset = Offset.zero;
          _cardRotation = 0;
        });
      });
    });
  }

  void _swipeLeft() {
    setState(() {
      _swipeIcon = Icons.close;
      _opacity = 1.0;
      _wrongCount++;
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          _opacity = 0;
          _swipeIcon = null;
          if (_currentIndex < widget.flashCards.length - 1) {
            _currentIndex++;
          } else {
            _showResult();
          }
          _cardOffset = Offset.zero;
          _cardRotation = 0;
        });
      });
    });
  }

  void _showResult() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Quiz Result"),
          content: Text("Correct: $_correctCount\nWrong: $_wrongCount"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _currentIndex = 0;
                  _correctCount = 0;
                  _wrongCount = 0;
                });
              },
            ),
          ],
        );
      },
    );
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Yanlış: ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            '$_wrongCount',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Doğru: ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            '$_correctCount',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: widget.flashCards.isNotEmpty
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        GestureDetector(
                          onPanUpdate: _onPanUpdate,
                          onPanEnd: _onPanEnd,
                          child: Transform.translate(
                            offset: _cardOffset,
                            child: Transform.rotate(
                              angle: _cardRotation,
                              child: FlipCard(
                                direction: FlipDirection.HORIZONTAL,
                                front: Container(
                                  width: 300,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 10,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.flashCards[_currentIndex].front,
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                back: Container(
                                  width: 300,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 10,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      widget.flashCards[_currentIndex].back,
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: _opacity,
                          duration: Duration(milliseconds: 300),
                          child: _swipeIcon != null
                              ? Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: _swipeIcon == Icons.check ? Colors.green : Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 10,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      _swipeIcon,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : SizedBox.shrink(),
                        ),
                      ],
                    )
                  : CircularProgressIndicator(), // Show a loading indicator while flashcards are loading
            ),
          ),
        ],
      ),
    );
  }
}
