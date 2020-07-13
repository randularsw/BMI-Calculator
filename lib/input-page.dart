import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable-card.dart';
import 'icon-content.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = 0xFF1D1E33;
const inactiveCardColour = 0xFF111328;
const bottomContainerColour = 0xFFEB1555;

enum Gender {
  male,
  female,
}

const labelTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8D8E98),
);

const numberTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  colour: Color(selectedGender == Gender.male
                      ? activeCardColour
                      : inactiveCardColour),
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: Color(selectedGender == Gender.female
                      ? activeCardColour
                      : inactiveCardColour),
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: Color(activeCardColour),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: numberTextStyle,
                      ),
                      Text(
                        " cm",
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFFFEB1555),
                      // overlayColor: Color(0x29FFEB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 20.0,
                      max: 200.0,
                      onChanged: (double newHeight) {
                        height = newHeight.toInt();
                        setState(() {
                          height = newHeight.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: Color(activeCardColour),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10,),
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Color(activeCardColour),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10,),
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(bottomContainerColour),
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
