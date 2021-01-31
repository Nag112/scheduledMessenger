import 'package:messenger/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Function onChange;
  final Function validator;
  final TextInputType keyboardType;
  CustomTextField({this.hint, this.onChange, this.validator,this.keyboardType});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        onChanged: onChange,
        onEditingComplete:()=> FocusScope.of(context).nextFocus(),
        validator: validator ?? (val) => null,
        keyboardType: keyboardType??TextInputType.text,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: kPrimaryColor,
            ),
            border: InputBorder.none),
      ),
    );
  }
}

class CustomPasswordField extends StatefulWidget {
  final Function onChange;
  final String hint;
  CustomPasswordField({this.onChange,this.hint});
  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onChanged: widget.onChange,
        obscureText: !visible,
        decoration: InputDecoration(
            hintText: widget.hint??"Password",
            hintStyle: TextStyle(
              color: kPrimaryColor,
            ),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(visible ? Icons.visibility_off : Icons.visibility),
              onPressed: () => setState(() {
                visible = !visible;
              }),
            )),
      ),
    );
  }
}
