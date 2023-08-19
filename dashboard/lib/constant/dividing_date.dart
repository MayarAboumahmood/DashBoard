import 'date.dart';

class DateTimeParser {
  final String inputDateString;

  DateTimeParser(this.inputDateString);

  MyDate parseDateTime() {
    List<String> parts = inputDateString.split(', ');
    String datePart = parts[0];
    String timePart = parts[1];

    List<String> dateComponents = datePart.split('/');
    int day = int.parse(dateComponents[1]);
    int month = int.parse(dateComponents[0]);
    int year = int.parse(dateComponents[2]);

    List<String> timeComponents = timePart.split(':');
    int hour = int.parse(timeComponents[0]);
    int minute = int.parse(timeComponents[1]);
    // int second = int.parse(timeComponents[2]);

    return MyDate(
        day: day, month: month, year: year, hour: hour, minute: minute);
    // return DateTime.now();
  }

  String getTime() {
    List<String> parts = inputDateString.split(', ');
    return parts[1];
  }
}

String getDayNameOfMonth(int year, int month, int day) {
  DateTime date = DateTime(year, month, day);
  int weekday = date.weekday;

  switch (weekday) {
    case DateTime.monday:
      return 'Monday';
    case DateTime.tuesday:
      return 'Tuesday';
    case DateTime.wednesday:
      return 'Wednesday';
    case DateTime.thursday:
      return 'Thursday';
    case DateTime.friday:
      return 'Friday';
    case DateTime.saturday:
      return 'Saturday';
    case DateTime.sunday:
      return 'Sunday';
    default:
      return 'Invalid Day';
  }
}



