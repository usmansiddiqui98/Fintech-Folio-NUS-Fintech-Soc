import 'package:flutter/material.dart';

const List<String> kSupportedCategory = [
  "Education",
  "Family",
  "Fashion",
  "Hobbies",
  "Food",
  "Housing",
  "Technology",
  "Transportation",
  "Travel",
  "Others",
];

const List<Color> kChartDataColors = [
  Color(0x5680E9),
  Color(0x84CEEB),
  Color(0x5AB9EA),
  Color(0x8860D0)
];

const List<MaterialColor> kRecentTransactionColors = [
  Colors.deepPurple,
  Colors.blue,
  Colors.indigo
];

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
