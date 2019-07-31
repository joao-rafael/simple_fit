import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.icon, this.title});
  Icon icon;
  String title;
  @override //overriding the superclass - StatelessWidget
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        icon,
        SizedBox(height: 15.0),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
