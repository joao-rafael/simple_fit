import 'package:flutter/material.dart';
import '../constants.dart';

class BottomBar extends StatelessWidget {
  BottomBar({@required this.onTap, this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kPink,
        margin: EdgeInsets.only(top: 10.0),
        height: 80.0,
        width: double.infinity,
        child: Center(child: Text(this.buttonTitle, style: kLabelTextStyle)),
      ),
    );
  }
}
