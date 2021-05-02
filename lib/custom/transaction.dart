import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction extends StatelessWidget {
  // const transaction({
  //   Key key,
  // }) : super(key: key);
  final String item;
  final String date;
  final MaterialColor color;
  final double cost;

  Transaction(this.item, this.date, this.color, this.cost);

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
