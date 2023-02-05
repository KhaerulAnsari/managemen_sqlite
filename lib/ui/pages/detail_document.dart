import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:managemen_sqlite/model/document.dart';
import 'package:managemen_sqlite/theme.dart';
import 'package:managemen_sqlite/ui/widgets/detail_document_card.dart';

class DetailDocumentPage extends StatelessWidget {
  Document? document;
  DetailDocumentPage({
    super.key,
    this.document,
  });

  @override
  Widget build(BuildContext context) {
    final startTime = DateFormat.yMMMd().format(document!.startDate!);
    final endTime = DateFormat.yMMMd().format(document!.endDate!);

    Widget title() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
          Expanded(
            child: Text(
              'Detail Dokumen',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: medium,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    Widget schaduleNumber() {
      return DetailDocumentCard(
        title: 'Schedule Number',
        dataDocument: document!.scheduleNumber,
      );
    }

    Widget impectionNumber() {
      return DetailDocumentCard(
        title: 'Inspection Number',
        dataDocument: document!.impectionNumber,
      );
    }

    Widget policeNumber() {
      return DetailDocumentCard(
        title: 'Police Number',
        dataDocument: document!.policeNumber,
      );
    }

    Widget vIN() {
      return DetailDocumentCard(
        title: 'VIN Number',
        dataDocument: document!.vin,
      );
    }

    Widget engineNumber() {
      return DetailDocumentCard(
        title: 'Engine Number',
        dataDocument: document!.engineNumber,
      );
    }

    Widget bodyNumber() {
      return DetailDocumentCard(
        title: 'Body Number',
        dataDocument: document!.bodyNumber,
      );
    }

    Widget model() {
      return DetailDocumentCard(
        title: 'Model',
        dataDocument: document!.model,
      );
    }

    Widget jobType() {
      return DetailDocumentCard(
        title: 'Job Type',
        dataDocument: document!.jobType,
      );
    }

    Widget houmeter() {
      return DetailDocumentCard(
        title: 'Houmeter',
        dataDocument: document!.houmeter,
      );
    }

    Widget kilometer() {
      return DetailDocumentCard(
        title: 'Kilometer',
        dataDocument: document!.kilometer,
      );
    }

    Widget priority() {
      return DetailDocumentCard(
        title: 'Priority',
        dataDocument: document!.priority,
      );
    }

    Widget costumer() {
      return DetailDocumentCard(
        title: 'Costumer',
        dataDocument: document!.customer,
      );
    }

    Widget foreman() {
      return DetailDocumentCard(
        title: 'Foreman',
        dataDocument: document!.foreman,
      );
    }

    Widget startDate() {
      return DetailDocumentCard(
        title: 'Start Date',
        dataDocument: startTime,
      );
    }

    Widget endDate() {
      return DetailDocumentCard(
        title: 'End Date',
        dataDocument: endTime,
      );
    }

    Widget remark() {
      return DetailDocumentCard(
        title: 'Remark',
        dataDocument: document!.remark,
      );
    }

    Widget status() {
      return DetailDocumentCard(
        title: 'Status',
        dataDocument: document!.status,
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                title(),
                const SizedBox(
                  height: 30,
                ),
                schaduleNumber(),
                impectionNumber(),
                policeNumber(),
                vIN(),
                engineNumber(),
                bodyNumber(),
                model(),
                jobType(),
                houmeter(),
                kilometer(),
                priority(),
                costumer(),
                foreman(),
                startDate(),
                endDate(),
                remark(),
                status(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
