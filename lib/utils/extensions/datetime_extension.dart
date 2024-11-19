
import 'package:intl/intl.dart';

extension PointsFormats on DateTime {

  String toPointsFormat() {
    try {
      final day = _suffixDay();
      final month = DateFormat('MMM').format(this);
      return '$day $month';
    } catch(error) {
      return "N/A";
    }
  }

  String _suffixDay() {
    final day = this.day;
    switch (day) {
      case 1: return '${day}st';
      case 2: return '${day}nd';
      case 3: return '${day}rd';
      default: return '${day}th';
    }
  }
}