// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dividing_date.dart';

class MyDate {
  int day;
  int month;
  int year;
  int hour;
  int minute;
  String? dayName;
  MyDate({
    required this.day,
    required this.month,
    required this.year,
    required this.hour,
    required this.minute,
  }){
    dayName=getDayNameOfMonth(year,month,day);
  }
  
}
