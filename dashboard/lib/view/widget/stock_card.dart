import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:dashboard/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../constant/sizes.dart';
import '../../main.dart';
import '../Screens/stock/stock_page.dart';

// ignore: must_be_immutable
class StockCard extends StatelessWidget {
  Drink drink;
  StockCard({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    print('context.widthInches');
    print(context.widthInches);
    Sizes size = Sizes(context);
    return MaterialButton(
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
            borderRadius: BorderRadius.circular(size.buttonRadius)),
        width: size.drinkCardWidth,
        height: 200,
        child: Stack(children: [
          Positioned(
            top: 0,
            child: SizedBox(
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
          ),
          Positioned(
            top: 152,
            left: sharedPreferences!.getString('lang') == 'en'
                ? context.widthInches < 7
                    ? size.drinkCardWidth / 2 - Get.size.width * .047
                    : context.widthInches > 10
                        ? size.drinkCardWidth / 2 - Get.size.width * .025
                        : size.drinkCardWidth / 2 - Get.size.width * .03
                : sharedPreferences!.getString('lang') == 'ar'
                    ? null
                    : context.widthInches < 7
                        ? size.drinkCardWidth / 2 - Get.size.width * .047
                        : context.widthInches > 10
                            ? size.drinkCardWidth / 2 - Get.size.width * .025
                            : size.drinkCardWidth / 2 - Get.size.width * .03,
            right: sharedPreferences!.getString('lang') == 'ar'
                ? context.widthInches < 7
                    ? size.drinkCardWidth / 2 - Get.size.width * .047
                    : context.widthInches > 10
                        ? size.drinkCardWidth / 2 - Get.size.width * .025
                        : size.drinkCardWidth / 2 - Get.size.width * .03
                : null,
            child: Column(
              children: [
                AutoSizeText(
                  drink.name,
                  style: generalTextStyle(20),
                ),
                AutoSizeText(
                  '${drink.unitPriceInSP} S.P',
                  style: generalTextStyle(15),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
