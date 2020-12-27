import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:bmi_calculator/components/Resuable_Card.dart';
import 'package:bmi_calculator/components/bottomButoon.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage ({@required this.interpretaion, @required this.bmiResult, @required this.resultText});

    final String bmiResult;
    final String resultText;
    final String interpretaion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',style: kTitleText, ),
            ),
          ),
          Expanded(
            flex: 5,
              child: ReusableCard(
                colour: kCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(resultText, style: kResultText,),
                    Text(bmiResult,style: kBMIText,),
                    Text(
                      interpretaion,
                      style: kBodyText,
                      textAlign: TextAlign.center,)
                  ],
                ),
              )
              ,
          ),
          BottomButton(onTap:(){
            Navigator.pop(context);
          }, buttonnTitile: 'RE-CALCULATE')

        ],

      ),
    );
  }
}
