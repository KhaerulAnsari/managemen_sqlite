import 'package:flutter/material.dart';
import 'package:managemen_sqlite/theme.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Color? bgColor;
  final Function? onTap;
  const CustomButton({
    super.key,
    this.title,
    this.bgColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: bgColor ?? blueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      onPressed: () {
        onTap!();
      },
      child: Text(
        title!,
        style: whiteTextStyle.copyWith(
          fontSize: 14,
          fontWeight: semiBold,
        ),
      ),
    );
  }
}
