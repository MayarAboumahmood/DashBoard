import 'package:dashboard/view/Screens/stock/stock_page.dart';
import 'package:get/get.dart';

class StockController extends GetxController {
  List<Drink> drinkList = [
    Drink(
        name: 'pipse',
        unitPriceInSP: 10000,
        disecraption: 'normal pipse',
        amountByLeter: 2.5,
        howMuchToMakeAUnit: 0.3),
    Drink(
        name: '7up',
        unitPriceInSP: 10000,
        disecraption: 'normal 7up',
        amountByLeter: 2.5,
        howMuchToMakeAUnit: 0.3),
    Drink(
        name: 'wine',
        unitPriceInSP: 30000,
        disecraption: 'normal pipse',
        amountByLeter: 2.5,
        howMuchToMakeAUnit: 0.3),
    Drink(
        name: 'somthing',
        unitPriceInSP: 10000,
        disecraption: 'normal pipse',
        amountByLeter: 2.5,
        howMuchToMakeAUnit: 0.3),
    Drink(
        name: 'another thing',
        unitPriceInSP: 10000,
        disecraption: 'normal pipse',
        amountByLeter: 2.5,
        howMuchToMakeAUnit: 0.3)
  ];
}
