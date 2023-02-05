import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managemen_sqlite/theme.dart';

class WarningDialog extends StatelessWidget {
  final String? message;
  final String? mainButtonTitle;
  final Function? onTap;

  const WarningDialog({
    Key? key,
    this.message,
    this.mainButtonTitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      key: key,
      title: Image.asset(
        'images/warning.png',
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
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    if (onTap != null) {
                      onTap!();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    mainButtonTitle!,
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blueColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Batal',
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
