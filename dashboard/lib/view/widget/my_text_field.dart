import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/theme.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  final String hintText;
  late TextStyle? hintStyle;
  final String labletext;
  // final Color enableColor;
  final Color? disableColor;
  final bool scurtext;
  final TextInputType textType;
  final Function(String?)? onsave;
  final void Function()? onEditingComplete;
  void Function(String)? onFieldSubmitted;
  // final void Function()? ontap;
  Function()? ontap;
  String? Function(String?)? validate;
  String? initvalue;

  MyTextField({
    Key? key,
    this.initvalue,
    required this.textType,
    this.validate,
    this.onsave,
    this.onFieldSubmitted,
    this.ontap,
    required this.scurtext,
    this.disableColor,
    // this.enableColor,
    this.onEditingComplete,
    required this.hintText,
    required this.labletext,
    TextEditingController? controller,
    this.hintStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
      ),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        initialValue: initvalue,
        keyboardType: textType,
        obscureText: scurtext,
        onSaved: onsave,
        onChanged: onsave,
        onTap: ontap,
        // onEditingComplete: onEditingComplete,
        validator: validate,
        decoration: InputDecoration(
          labelStyle:
              TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
          labelText: labletext,
          hintText: hintText,
          hintStyle: hintStyle,
          contentPadding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .04,
              vertical: MediaQuery.of(context).size.height * .02),
          border: const OutlineInputBorder(
              // borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                  color: Get.isDarkMode ? Colors.white54 : Colors.black)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
                color: Get.isDarkMode
                    ? Themes.customdarktheme.primaryColor
                    : Colors.black),
          ),
        ),
      ),
    );
  }
}
