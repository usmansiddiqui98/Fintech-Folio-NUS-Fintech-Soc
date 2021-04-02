import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final Color color;

  RoundedButton({this.title, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Material(
        elevation: 5.0,
        color: this.color,
        borderRadius: BorderRadius.circular(15.0),
        child: MaterialButton(
          onPressed: this.onPressed,
          minWidth: 250.0,
          height: 42.0,
          child: Text(
            this.title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}