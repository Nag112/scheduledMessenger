import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:messenger/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPress;
  final bool isBusy;
  final Color color, textColor;
  final double width;
  const RoundedButton({
    this.isBusy = false,
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
      padding: EdgeInsets.all(10),
      width: size.width * width,
      child: FlatButton(
        child: isBusy
            ? SpinKitFadingCircle(
                color: Colors.white,
                size: 20,
              )
            : Text(
                text,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
        color: color,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        splashColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        textColor: textColor,
        onPressed: isBusy ? () {} : onPress,
      ),
    );
  }
}
