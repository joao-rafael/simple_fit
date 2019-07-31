import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 150;
  int weight = 70;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SimpleFit'),
        ),
        backgroundColor: Color(0xFF0F0F1E),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: IconContent(
                        icon: Icon(FontAwesomeIcons.mars, size: 80.0),
                        title: "HOMEM"),
                  )),
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: IconContent(
                        icon: Icon(FontAwesomeIcons.venus, size: 80.0),
                        title: "MULHER"),
                  )),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kInactiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('ALTURA', style: kLabelTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(height.toString(), style: kMainLabelStyle),
                              Text('cm', style: kLabelTextStyle)
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 12.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 17.0)),
                            child: Slider(
                              value: height.toDouble(),
                              min: kMinHeight.toDouble(),
                              max: kMaxHeight.toDouble(),
                              onChanged: (double newValue) {
                                print(newValue);
                                setState(() {
                                  //needed to change the widget state
                                  height = newValue.toInt();
                                });
                              },
                              activeColor: kPink,
                              inactiveColor: Color(0xFF8D8E98),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  colour: kInactiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('PESO', style: kLabelTextStyle),
                      Text(weight.toString(), style: kMainLabelStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButton(
                            child: Icon(FontAwesomeIcons.minus),
                            backgroundColor: Colors.grey,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                              print(weight);
                            },
                          ),
                          SizedBox(width: 10.0),
                          RoundButton(
                            child: Icon(FontAwesomeIcons.plus),
                            backgroundColor: Colors.grey,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                              print(weight);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: kInactiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('IDADE', style: kLabelTextStyle),
                      Text(age.toString(), style: kMainLabelStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButton(
                            child: Icon(FontAwesomeIcons.minus),
                            backgroundColor: Colors.grey,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                              print(age);
                            },
                          ),
                          SizedBox(width: 10.0),
                          RoundButton(
                            child: Icon(FontAwesomeIcons.plus),
                            backgroundColor: Colors.grey,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                              print(age);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            )),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/result');
              },
              child: Container(
                color: kPink,
                margin: EdgeInsets.only(top: 10.0),
                height: 80.0,
                width: double.infinity,
                child: Text('CALCULAR IMC', style: kLabelTextStyle),
              ),
            ),
          ],
        ));
  }
}

class RoundButton extends StatelessWidget {
  /**
   * To use:
   * RoundButton(
   *  child: widget(),
   *  backgroundColor: Color(),
   *  onPressed: (){}
   *  );
   */
  // constructor and properties
  RoundButton({@required this.backgroundColor, this.child, this.onPressed});
  final Color backgroundColor;
  final Widget child;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: 40.0, height: 40.0),
      onPressed: onPressed,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: backgroundColor,
      child: child,
    );
  }
}
