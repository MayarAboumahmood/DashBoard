import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  String title;
  Function()? ontap;
  Color? mycolor;
  double mywidth;
  double myheight;
  double myRadius;
  double myfontSize;
  double myShadow;

  MyButton({
    Key? key,
    /*required this.bordercolor,*/
    this.mycolor,
    required this.title,
    required this.ontap,
    required this.myheight,
    required this.mywidth,
    this.myRadius = 20,
    this.myfontSize = 20,
    this.myShadow = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        height: myheight,
        width: mywidth,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: Offset(MediaQuery.of(context).size.width * .01,
                  MediaQuery.of(context).size.height * myShadow),
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 8)
        ], color: mycolor, borderRadius: BorderRadius.circular(myRadius)),
        child: Text(
          title,
          style: TextStyle(fontSize: myfontSize, color: Colors.white),
        ),
      ),
    );
  }
}
