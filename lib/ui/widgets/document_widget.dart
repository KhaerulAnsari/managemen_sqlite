import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managemen_sqlite/database/document_database.dart';
import 'package:managemen_sqlite/model/document.dart';
import 'package:managemen_sqlite/theme.dart';
import 'package:managemen_sqlite/ui/pages/edit_document_page.dart';
import 'package:managemen_sqlite/ui/widgets/succes_dialog.dart';
import 'package:managemen_sqlite/ui/widgets/warning_dialog.dart';

class DocumentWidget extends StatelessWidget {
  final Document? document;
  final int? index;
  const DocumentWidget({
    super.key,
    this.document,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
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
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(
                      EditDocumentPage(
                        document: document,
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 3,
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
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (c) {
                        return WarningDialog(
                          message: 'Apakah anda ingin menghapus dokumen ini?',
                          mainButtonTitle: 'Hapus',
                          onTap: () async {
                            await DocumentDatabase.instance
                                .delete(document!.id!);
                            Get.back();
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (c) {
                                return const SuccesDialog(
                                  message:
                                      'Dokument berhasil dihapus.\nSilahkan refresh halaman ini.',
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 3,
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
          ],
        ),
      ),
    );
  }
}
