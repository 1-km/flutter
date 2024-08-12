import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get formattedDate => DateFormat('dd/MM/yyyy').format(this);

// test
  String get formatted => DateFormat('MM/dd').format(this);

  String get formattedTime => DateFormat('HH:mm').format(this);

  String get formattedDateTime => DateFormat('dd/MM/yyyy HH:mm').format(this);

  String get formattedDateComa => DateFormat('yyyy.MM.dd').format(this);

  String get formattedLateTime => DateFormat('mm분전').format(this);
}

class DateFormatter {
  static String formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 1) {
      return '방금 전';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}분 전';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}시간 전';
    } else {
      return '${date.year}.${date.month}.${date.day}';
    }
  }
}

class HalfHourFormatter {
  static String formatDate(DateTime date) {
    if (date.hour > 12) {
      if (date.minute < 10) {
        return '오후 ${date.hour - 12}:0${date.minute}';
      }
      return '오후 ${date.hour - 12}:${date.minute}';
    } else if (date.hour == 12) {
      return '오후 ${date.hour}:${date.minute}';
    } else {
      return '오전 ${date.hour}:${date.minute}';
    }
  }
}
