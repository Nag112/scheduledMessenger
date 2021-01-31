import 'package:messenger/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final Function validator;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.validator,
    this.labelText,
    this.keyboardType = TextInputType.text,
    this.icon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        keyboardType: keyboardType,
        cursorColor: kPrimaryColor,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          labelText: labelText,
          hintText: "Enter your ${labelText.toLowerCase()}",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryLightColor),
              borderRadius: BorderRadius.circular(40)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(40)),
          suffixIcon: Icon(
            icon,
            color: kPrimaryLightColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String labelText;
  final String hintText;
  const RoundedPasswordField({
    Key key,
    this.hintText,
    this.labelText = "Password",
    this.onChanged,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        obscureText: !visible,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          labelText: widget.labelText,
          hintText:
              widget.hintText ?? "Enter your ${widget.labelText.toLowerCase()}",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryLightColor),
              borderRadius: BorderRadius.circular(40)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(40)),
          focusColor: kPrimaryColor,
          suffixIcon: IconButton(
            icon: Icon(visible ? Icons.visibility_off : Icons.visibility),
            onPressed: () => setState(() {
              visible = !visible;
            }),
            color: kPrimaryLightColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function onPress;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.onPress,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: onPress,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(fontSize: 16, color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
