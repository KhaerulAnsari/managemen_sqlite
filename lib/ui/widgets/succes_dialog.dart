// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managemen_sqlite/theme.dart';

class SuccesDialog extends StatelessWidget {
  final String? message;
  const SuccesDialog({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      key: key,
      title: Image.asset(
        'images/succes.png',
        height: 80,
      ),
      content: Text(
        message!,
        style: greyTextStyle.copyWith(
          fontSize: 16,
          fontWeight: regular,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Selesai',
              style: whiteTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: blueColor,
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
