import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/Icon_Content.dart';
import 'package:bmi_calculator/components/Resuable_Card.dart';
import 'package:bmi_calculator/constants.dart';
import 'result_page.dart';
import 'package:bmi_calculator/components/bottomButoon.dart';
import 'package:bmi_calculator/components/roundIconButton.dart';
import 'calculator_brain.dart';



enum Gender{
   male,
   female,
}

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 20;
  Gender selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender = Gender.male;

                    });
                  },
                  child: ReusableCard(colour: selectedGender == Gender.male ? kCardColor : kinactiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                  ),),
                ),),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: ReusableCard(colour: selectedGender == Gender.female ? kCardColor : kinactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),),
              ),),
            ],
          )),
          Expanded(child: ReusableCard(
            colour: kCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: klabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                  Text(height.toString(),
                  style: knumlabel,),
                  Text('cm',
                  style: klabelTextStyle,),

                ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8398),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),



                  ),
                  child: Slider(value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged:(double newValue){
                      setState(() {
                      height = newValue.round();

                    });
                      }),
                ),
              ],
            ),
          )
          ),
          Expanded(child:Row( children: <Widget>[
            Expanded(child:ReusableCard(
              colour: kCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('WEIGHT',
                  style: klabelTextStyle,),
                  Text(weight.toString(),
                  style: knumlabel),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    RoundIconButton(
                      icon: FontAwesomeIcons.minus,
                      onPressed: (){
                        setState(() {
                          weight--;
                        });
                      },
                    ),
                      SizedBox(
                      width: 10.0,
                      ),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: (){
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                  ],)

                ],
              ),
            ),

            ),
            Expanded(
                child: ReusableCard(
                    colour: kCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('AGE',style: klabelTextStyle,),
                    Text(age.toString(), style: knumlabel,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: (){
                          setState(() {
                            age--;
                          });
                        },
                      ),
                      SizedBox(
                            width: 10.0,
              ),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: (){
                          setState(() {
                            age++;
                          },);
                        },
                      )
                    ],)
                  ],
                ),),
            ),])),


          BottomButton(buttonnTitile:'CALCULATE',

            onTap: (){
            Calculator_brain calc = Calculator_brain(height: height,weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
              bmiResult: calc.CalculateBMI(),
              resultText: calc.getResult(),
              interpretaion: calc.getInterpretation(),

            )));
          },)],
      )
      );
  }
}


