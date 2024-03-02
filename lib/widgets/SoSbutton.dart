import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SOSButton extends StatefulWidget {
  @override
  _SOSButtonState createState() => _SOSButtonState();
}

class _SOSButtonState extends State<SOSButton> {
  bool isClicked = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          isClicked = !isClicked;
          if(isClicked==true){

          }
        });
      },
      child: Container(
        // Adjust container size as needed
        width: 200,
        height: 200,
        child: Lottie.asset(
          'lib/Assets/SOSbutton.json', // Path to your Lottie animation file
          animate: isClicked,

        ),
      ),
    );
  }
}