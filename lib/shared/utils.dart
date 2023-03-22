import 'package:flutter/material.dart';

String convertDate(DateTime date) {
  final day =
      "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}";
  final hour =
      "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";

  return '$day às $hour';
}

IconData getCorrectIcon(int type) {
  return type == 0
      ? Icons.local_bar_rounded
      : type == 1
          ? Icons.local_pizza_rounded
          : type == 2
              ? Icons.local_fire_department_rounded
              : Icons.people_alt;
}
