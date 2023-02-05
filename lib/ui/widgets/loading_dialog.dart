// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:managemen_sqlite/theme.dart';

class LoadingDialog extends StatelessWidget {
  final String? message;
  const LoadingDialog({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          circularProgress(),
          const SizedBox(
            height: 10,
          ),
          Text(
            message! + ', Mohon tunggu...',
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }

  circularProgress() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 12),
      child: CircularProgressIndicator(
        color: blueColor,
      ),
    );
  }
}
