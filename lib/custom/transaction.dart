import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class transaction extends StatelessWidget {
  // const transaction({
  //   Key key,
  // }) : super(key: key);
  String item;
  String date;
  MaterialColor color;
  double cost;

  transaction(String item, String date, MaterialColor color, double cost) {
    this.item = item;
    this.date = date;
    this.color = color;
    this.cost = cost;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: this.color,
          ),
        ),
        Column(
          children: [
            Text(this.item),
            Text(this.date),
          ],
        ),
        Expanded(
          child: Text(
            this.cost.toString(),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
