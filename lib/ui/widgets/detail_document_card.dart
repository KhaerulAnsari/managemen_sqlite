import 'package:flutter/material.dart';
import 'package:managemen_sqlite/theme.dart';

class DetailDocumentCard extends StatelessWidget {
  final String? title;
  final String? dataDocument;
  const DetailDocumentCard({
    super.key,
    this.title,
    this.dataDocument,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title! + ' : ',
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            dataDocument!,
            style: greyTextStyle,
          ),
          const SizedBox(
            height: 3,
          ),
          Divider(
            thickness: 1,
            height: 1,
            color: greyColor.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
