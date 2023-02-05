import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managemen_sqlite/model/document_web.dart';
import 'package:managemen_sqlite/theme.dart';
import 'package:managemen_sqlite/ui/pages/web/add_document_web_page.dart';
import 'package:managemen_sqlite/ui/widgets/custom_button.dart';
import 'package:managemen_sqlite/ui/widgets/null_data.dart';
import 'package:managemen_sqlite/ui/widgets/table_document.dart';

class MaintanancePageWeb extends StatefulWidget {
  const MaintanancePageWeb({super.key});

  @override
  State<MaintanancePageWeb> createState() => _MaintanancePageWebState();
}

class _MaintanancePageWebState extends State<MaintanancePageWeb> {
  bool? inCreate = false;
  @override
  Widget build(BuildContext context) {
    Widget documentData() {
      return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('document').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: blueColor,
              ),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: NullData(
                title: 'Upss Document Kosong!!',
                subtitle:
                    'Untuk saat ini dokumen masih kosong,\nSilahkan tambahkan dokumen.',
              ),
            );
          } else {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Table(
                  // border: TableBorder.all(
                  //     color: const Color(0xFF565656), width: 0.5),
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
                      decoration: const BoxDecoration(
                        color: Color(0xFFD7DFE9),
                      ),
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Text(
                              'Schedule No',
                              style: blackTextStyle.copyWith(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Text(
                              'Plate Number',
                              style: blackTextStyle.copyWith(),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Vin',
                              style: blackTextStyle.copyWith(),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Model Year',
                              style: blackTextStyle.copyWith(),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Job Type',
                              style: blackTextStyle.copyWith(),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Impection No',
                              style: blackTextStyle.copyWith(),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Start Date',
                              style: blackTextStyle.copyWith(),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Status',
                              style: blackTextStyle.copyWith(),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Action',
                              style: blackTextStyle.copyWith(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentWebModel model = DocumentWebModel.fromJson(
                        snapshot.data!.docs[index].data()!
                            as Map<String, dynamic>);

                    return TableDocument(
                      model: model,
                      edit: () {},
                      delete: () {},
                    );
                  },
                ),
              ],
            );
          }
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Maintanance Schedule',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                width: 100,
                height: 30,
                child: CustomButton(
                  title: 'Create New',
                  onTap: () {
                    Get.to(
                      const AddDocumentWebPage(),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          documentData(),
        ],
      ),
    );
  }
}
