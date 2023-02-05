import 'package:flutter/material.dart';
import 'package:managemen_sqlite/theme.dart';

class CustomCardMenu extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final Function? onTap;
  const CustomCardMenu({
    super.key,
    this.imageUrl,
    this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: SizedBox(
        width: (MediaQuery.of(context).size.width - 54) / 2,
        height: 160,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageUrl!,
                width: 80,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                title!,
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
