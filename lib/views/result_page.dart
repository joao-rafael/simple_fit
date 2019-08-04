import 'package:flutter/material.dart';
import 'package:simple_fit/constants.dart';
import 'package:simple_fit/components/reusable_card.dart';
import 'package:simple_fit/components/bottom_bar.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmi, this.resultText, this.advice});

  final String bmi;
  final String resultText;
  final String advice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Simple Fit'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    left: 5.0, top: 10.0, right: 5.0, bottom: 10.0),
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Resultado do seu IMC',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Color(0xffffffff),
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                  colour: kActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(resultText.toUpperCase(), style: kResultTextStyle),
                      Text(bmi, style: kBMIResultStyle),
                      Text(advice,
                          style: kBodyResultStyle, textAlign: TextAlign.center),
                    ],
                  )),
            ),
            Expanded(
                child: BottomBar(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'Voltar',
            ))
          ],
        ));
  }
}
