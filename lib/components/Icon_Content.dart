import 'package:flutter/material.dart';
class IconContent extends StatelessWidget {
  IconContent({@required this.icon, this.text});

  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Color(0xFFFFFFFFF),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8398),
          ),
        )
      ],

    );
  }
}