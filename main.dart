import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(
          title: Text('The Dice App',
              style: TextStyle(
                color: Color(0xff030303),
                fontWeight: FontWeight.bold,
              )
          ),
          backgroundColor: Colors.pink[200],
          centerTitle: true,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RichText(
            textScaleFactor : 9.0,
            text: TextSpan(
              text: '${leftDiceNumber + rightDiceNumber}',
              style: DefaultTextStyle.of(context).style,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Image.asset(
                  'images/dice$leftDiceNumber.png',
                ),
              ),
              //Get students to create the second die as a challenge
              Expanded(
                child: Image.asset(
                  'images/dice$rightDiceNumber.png',
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.pink[200]),
            onPressed: changeDiceFace,
            child: const Text('Roll Dice',
            style: TextStyle(
              color: Color(0xff030000),
              fontWeight: FontWeight.bold,
            ),),
          )
        ],
      ),
    );
  }
}
