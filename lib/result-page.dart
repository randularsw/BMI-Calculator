import 'constants.dart';
import 'package:flutter/material.dart';
import 'reusable-card.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: Color(kActiveCardColour),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Normal',
                    style: kResultTextStyle,
                  ),
                  Text(
                    '18.5',
                    style: kBMITextStyle,
                  ),
                  Text(
                    'Your BMI is low',
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
