import 'package:intl/intl.dart';

class DateHelper {

  static String formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }

}