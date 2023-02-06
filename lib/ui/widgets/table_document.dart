import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:managemen_sqlite/model/document_web.dart';
import 'package:managemen_sqlite/theme.dart';

class TableDocument extends StatelessWidget {
  final DocumentWebModel? model;
  final Function? edit;
  final Function? delete;
  const TableDocument({
    super.key,
    this.model,
    this.edit,
    this.delete,
  });

  @override
  Widget build(BuildContext context) {
    Timestamp stamp = model!.startDate!;

    DateTime date = stamp.toDate();
    final startTime = DateFormat('yyy-MM-dd').format(date);
    return Table(
      // border: TableBorder.all(

      //   width: 1,
      //   style: BorderStyle.solid,
      //   color: const Color(0xFF565656),
      // ),
      // border: TableBorder.symmetric(
      //   outside: const BorderSide(
      //     color: Colors.black45,
      //     width: 0.5,
      //     style: BorderStyle.solid,
      //   ),
      //   inside: const BorderSide(
      //     color: Colors.black26,
      //     width: 1,
      //     style: BorderStyle.solid,
      //   ),
      // ),
      columnWidths: const {
        0: FlexColumnWidth(1.5),
        1: FlexColumnWidth(1.5),
        2: FlexColumnWidth(1.5),
        3: FlexColumnWidth(1.5),
        4: FlexColumnWidth(1.5),
        5: FlexColumnWidth(1.5),
        6: FlexColumnWidth(1.5),
        7: FlexColumnWidth(1.5),
        8: FlexColumnWidth(1.5),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: whiteColor,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 5,
              ),
              child: Text(
                // ignore: prefer_interpolation_to_compose_strings
                model!.scheduleNumber!,
                style: blackTextStyle.copyWith(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                model!.policeNumber.toString(),
                style: blackTextStyle.copyWith(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                model!.vin.toString(),
                style: blackTextStyle.copyWith(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                model!.model.toString(),
                style: blackTextStyle.copyWith(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                model!.jobType.toString(),
                style: blackTextStyle.copyWith(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                model!.impectionNumber.toString(),
                style: blackTextStyle.copyWith(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                startTime,
                style: blackTextStyle.copyWith(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Text(
                model!.status.toString(),
                style: blackTextStyle.copyWith(),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (() {
                        if (edit != null) {
                          edit!();
                        }
                      }),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFCDC06),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: whiteColor,
                          size: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (delete != null) {
                          delete!();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEF6B30),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Icon(
                          Icons.delete,
                          color: whiteColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
