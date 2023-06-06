import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sized_context/sized_context.dart';

import '../../widget/divider_with_word.dart';
import '../../widget/slide_drawer.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: context.widthInches < 6 ? SlideDrawer() : null,
        body: Row(children: [
          Visibility(visible: context.widthInches > 6, child: SlideDrawer()),
          Column(
            children: [
              dividerWithWord(
                'Fulfilled orders'.tr,
              ),
              const SizedBox(
                height: 10,
              ),
              //to put a listView.builder from a order card
              const SizedBox(
                height: 10,
              ),
              dividerWithWord(
                'unfulfilled orders'.tr,
              ),
              const SizedBox(
                height: 10,
              ),

              //to put a listView.builder from a order card
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ]));
  }
}
