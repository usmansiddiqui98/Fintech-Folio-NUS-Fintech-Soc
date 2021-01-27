import 'package:flutter/material.dart';

class GradientAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  GradientAppBar({Key key, this.title}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _GradientAppBarState createState() => _GradientAppBarState();
}

class _GradientAppBarState extends State<GradientAppBar>{

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.menu),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Icon(Icons.search),
        ),
      ],
      centerTitle: true,
      title: Text(widget.title),
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[Color(0xCF8860D0), Color(0xC75A82EA)])),
      ),
    );
  }
}