import 'package:flutter/material.dart';

List statusColors = [
  Colors.yellow,
  Colors.orangeAccent,
  Colors.blue.shade400,
  Colors.green
];

String getStatusTranslation(int status) {
  List<String> statusTranslations = [
    'Создано',
    'В процессе',
    'Доставляется',
    'Завершено',
  ];

  if (status < 0 || status >= statusTranslations.length) {
    throw ArgumentError('Invalid status provided');
  }

  return statusTranslations[status];
}

String formatDateTime(DateTime dateTime) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  String day = twoDigits(dateTime.day);
  String month = twoDigits(dateTime.month);
  String year = dateTime.year.toString();
  String hour = twoDigits(dateTime.hour);
  String minute = twoDigits(dateTime.minute);

  return "$day.$month.$year  $hour:$minute";
}

String formatPrice(num price) {
  // Convert the price to a string with two decimal places
  String formattedPrice = price.toStringAsFixed(2);

  // Remove trailing '.00' from the formatted price
  if (formattedPrice.endsWith('.00')) {
    formattedPrice = formattedPrice.substring(0, formattedPrice.length - 3);
  }

  // Add commas to separate thousands
  List<String> parts = formattedPrice.split('.');
  String integerPart = parts[0];
  String decimalPart = parts.length > 1 ? '.' + parts[1] : '';

  // Add commas to integer part
  String result = '';
  int count = 0;
  for (int i = integerPart.length - 1; i >= 0; i--) {
    result = integerPart[i] + result;
    count++;
    if (count % 3 == 0 && i > 0) {
      result = ' ' + result;
    }
  }

  return result + decimalPart;
}
