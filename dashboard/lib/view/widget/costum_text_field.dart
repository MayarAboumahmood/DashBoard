import 'package:dashboard/constant/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/theme.dart';

// ignore: must_be_immutable
class CostumTextField extends StatelessWidget {
  String hint;
  late TextStyle? hintStyle;
  late TextStyle? labelStyle;
  String? label;
  Widget? iconsuffex;
  TextInputType? inputtype;
  Function(String?)? onsaved;
  Function()? onTap;
  String? Function(String?)? validat;
  TextEditingController? controller;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool? sucer;
  double? reduis;
  late double widthOnTheScreen;
  CostumTextField(
      {Key? key,
      this.labelStyle,
      this.suffixIcon,
      this.sucer,
      this.prefixIcon,
      required this.hint,
      this.label,
      this.iconsuffex,
      this.inputtype,
      this.onsaved,
      this.onTap,
      this.controller,
      this.hintStyle,
      this.reduis,
      required this.widthOnTheScreen,
      this.validat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthOnTheScreen,
      child: TextFormField(
        cursorColor: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
        style: TextStyle(
            color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
            fontFamily: jostFontFamily),
        obscureText: sucer ?? true,
        validator: validat,
        controller: controller,
        onSaved: onsaved,
        onTap: onTap,
        keyboardType: inputtype,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Get.isDarkMode ? darkPrimaryColor : primaryColor)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Get.isDarkMode ? darkPrimaryColor : primaryColor)),
            hintText: hint,
            hintStyle: hintStyle,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    reduis == null ? 5 : reduis as double)),
            label: label != null
                ? Text(
                    label!,
                    style: labelStyle,
                  )
                : null,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            prefixIconColor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
            suffixIconColor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: !Get.isDarkMode ? darkPrimaryColor : primaryColor),
              borderRadius:
                  BorderRadius.circular(reduis == null ? 5 : reduis as double),
            ),
            // floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .07)),
      ),
    );
  }
}
