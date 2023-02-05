import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managemen_sqlite/theme.dart';
import 'package:unicons/unicons.dart';

snackbarBox(String message) {
  return Get.snackbar(
    '',
    '',
    backgroundColor: const Color(0xFFFF5C83),
    icon: GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Icon(
        UniconsLine.times_circle,
        color: whiteColor,
      ),
    ),
    titleText: Text(
      'Kesalahan!',
      style: whiteTextStyle.copyWith(
        fontWeight: semiBold,
        fontSize: 16,
      ),
    ),
    messageText: Text(
      message,
      style: textStyle.copyWith(
        fontWeight: ligth,
        color: const Color(0xFFDCDADA),
      ),
    ),
  );
}
