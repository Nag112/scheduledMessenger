import 'package:flutter/material.dart';
import 'package:messenger/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPress;
  final Color color, textColor;
  final double width;
  const RoundedButton({
    Key key,
    @required this.text,
    @required this.onPress,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.width = 0.8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: size.width * width,
      child: FlatButton(
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        color: color,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        splashColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(29),
        ),
        textColor: textColor,
        onPressed: onPress,
      ),
    );
  }
}
