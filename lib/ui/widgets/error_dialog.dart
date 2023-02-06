// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managemen_sqlite/theme.dart';

class ErrorDialog extends StatelessWidget {
  final String? message;
  const ErrorDialog({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      key: key,
      title: Image.asset(
        'images/error.png',
        height: 80,
      ),
      content: Text(
        message!,
        style: greyTextStyle.copyWith(
          fontSize: 16,
          fontWeight: regular,
        ),
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          height: 45,
          child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Ok',
              style: whiteTextStyle,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD9435E),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
