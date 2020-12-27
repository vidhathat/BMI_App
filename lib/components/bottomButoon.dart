import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonnTitile});

  final Function onTap;
  final String buttonnTitile;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text( buttonnTitile,
            style: klargetext,
          ),
        ),
        color: kbottomConColor,
        height: kbottomConHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),

      ),
    );
  }
}