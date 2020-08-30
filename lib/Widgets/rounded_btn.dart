import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String btnText;
  final Function onPress;

  RoundedButton({this.onPress, this.btnText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.black54, width: 2.0),
        ),
        color: Colors.blueGrey,
        child: Text(
          btnText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}
