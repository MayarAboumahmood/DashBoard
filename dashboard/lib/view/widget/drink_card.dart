import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/sizes.dart';
import '../Screens/stock/stock_page.dart';

// ignore: must_be_immutable
class DrinkCard extends StatelessWidget {
  Drink drink;
  Function()? onPressed;
  DrinkCard({super.key, required this.drink, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
            borderRadius: BorderRadius.circular(size.buttonRadius)),
        width: size.drinkCardWidth,
        height: 210,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            width: size.drinkCardWidth,
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size.buttonRadius),
                topRight: Radius.circular(size.buttonRadius),
              ),
              child: Image.asset(
                'assets/images/my hero acadime.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          AutoSizeText(
            drink.name,
            style: generalTextStyle(20),
          ),
          const SizedBox(
            height: 3,
          ),
          AutoSizeText(
            '${drink.unitPriceInSP} S.P',
            style: generalTextStyle(15),
          ),
        ]),
      ),
    );
  }
}
