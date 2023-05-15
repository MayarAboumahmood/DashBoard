// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dashboard/constant/sizes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  Widget child;
  Function()? ontap;
  Color? mycolor;
  double mywidth;
  double myheight;
  double myRadius;
  double myShadow;
  double paddingInside;
  MyButton({
    Key? key,
    /*required this.bordercolor,*/
    required this.child,
    required this.ontap,
    this.mycolor,
    required this.mywidth,
    required this.myheight,
    this.myRadius = 20,
    this.myShadow = 0,
    this.paddingInside = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Sizes(context).normalButtonInsidePaddin),
        alignment: Alignment.center,
        height: myheight,
        width: mywidth,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              offset: Offset(2, 4),
              color: Colors.black26,
              spreadRadius: 01,
              blurRadius: 8)
        ], color: mycolor, borderRadius: BorderRadius.circular(myRadius)),
        child: child,
      ),
    );
  }
}
