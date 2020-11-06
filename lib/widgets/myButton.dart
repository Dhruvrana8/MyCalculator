import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final String text;
  final onTap;
  final buttonColor;
  final textColor;
  myButton({this.text,this.onTap,this.buttonColor,this.textColor});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 8,right: 8,bottom: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            color: buttonColor,
            child: Center(
                child: Text(text,style: TextStyle(
                    fontSize: 28,
                    color: Colors.white
                ),)
            ),
          ),
        ),
      ),
    );
  }
}
