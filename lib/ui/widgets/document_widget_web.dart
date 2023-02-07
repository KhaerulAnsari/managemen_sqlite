import 'package:flutter/material.dart';
import 'package:managemen_sqlite/model/document_web.dart';
import 'package:managemen_sqlite/theme.dart';
import 'package:managemen_sqlite/ui/widgets/warning_dialog.dart';

class DocumentWidgetWeb extends StatelessWidget {
  final DocumentWebModel? document;
  final int? index;
  final Function? edit;
  final Function? delete;
  const DocumentWidgetWeb({
    super.key,
    this.document,
    this.index,
    this.edit,
    this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Schedule Number : ',
                              style: greyTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: ligth,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              document!.scheduleNumber!,
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              'Inspection Number : ',
                              style: greyTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: ligth,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              document!.impectionNumber!,
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              'Police Number : ',
                              style: greyTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: ligth,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              document!.policeNumber!,
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        edit!();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(
                            3,
                          ),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: whiteColor,
                          size: 22,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        delete!();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(
                            3,
                          ),
                        ),
                        child: Icon(
                          Icons.delete,
                          color: whiteColor,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
