import 'package:flutter/material.dart';
import 'package:managemen_sqlite/theme.dart';

class NullData extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? subtitle;
  const NullData({Key? key, this.title, this.subtitle, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl ?? 'images/register.png',
            height: 250,
            fit: BoxFit.fill,
          ),

          const SizedBox(
            height: 10,
          ),

          // TEXT
          Text(
            title.toString(),
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: medium,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(
            height: 8,
          ),

          //
          Text(
            subtitle.toString(),
            style: greyTextStyle.copyWith(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
