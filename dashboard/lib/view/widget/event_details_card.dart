// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dashboard/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/sizes.dart';
import '../../data/Models/Event_info_model.dart';
import '../Screens/select_worker/select_worker.dart';

// ignore: must_be_immutable
class EventDetailsCard extends StatelessWidget {
  bool? theOrderIsFulfilled;
  Reservation model;
  EventDetailsCard({
    Key? key,
    this.theOrderIsFulfilled,
    required this.model
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.buttonRadius),
        color: Get.isDarkMode
            ? const Color.fromARGB(255, 54, 54, 54)
            : Colors.grey[400],
      ),
      child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Reservation name:  ${model.customerName}",
            style: generalTextStyle(null),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Table number : ${model.sectionNumber?? " Unkown" }",
            style: generalTextStyle(null),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Worker provit : ${model.worker?? "No One"}",
            style: generalTextStyle(null),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Order numbers : ${model.orders!.length.toString()}",
            style: generalTextStyle(null),
          ),
          const SizedBox(
            height: 5,
          ),
          getOrders(),
          const SizedBox(
            height: 5,
          ),

          Visibility(
            visible:
                theOrderIsFulfilled == null ? false : !theOrderIsFulfilled!,
            child: TextButton(
                onPressed: () {
                  showSelectWrokerDialog(context);
                },
                child: Text(
                  'Change the worker'.tr,
                  style: generalTextStyle(20),
                )),
          )
        ],
      )),
    );
  }

  void showSelectWrokerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: const SelectWorker(),
        );
      },
    );
  }

  Widget getOrders(){
    List<Widget> f=[];
    List.generate(model.orders!.length, (index) {
      f.add(const SizedBox(
            height: 5,
          ),);
      f.add( Text(
      "Order number : $index \n Number of drinks : ${model.orders![index].orderDrinks.length} \n Bill :${getbillForOneOrder(model.orders as List<Order>).toString()} " ));
  });

  return Column(children: f,);
  }
  getbillForOneOrder(List<Order> orders){
    double total=0.0;
    for (var i = 0; i < orders.length; i++) {
     for (var j = 0; j < orders[i].orderDrinks.length; j++) {
       
     total+=orders[i].orderDrinks[j].quantity; 
     } 
    }
    return total;
  }
}
