import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:managemen_sqlite/model/document_web.dart';
import 'package:managemen_sqlite/service/document_service.dart';
import 'package:managemen_sqlite/theme.dart';
import 'package:managemen_sqlite/ui/widgets/custom_button.dart';
import 'package:managemen_sqlite/ui/widgets/error_dialog.dart';
import 'package:managemen_sqlite/ui/widgets/form_dialog.dart';
import 'package:managemen_sqlite/ui/widgets/form_widgets.dart';
import 'package:managemen_sqlite/ui/widgets/loading_dialog.dart';
import 'package:managemen_sqlite/ui/widgets/null_data.dart';
import 'package:managemen_sqlite/ui/widgets/succes_dialog.dart';
import 'package:managemen_sqlite/ui/widgets/table_document.dart';
import 'package:managemen_sqlite/ui/widgets/warning_dialog.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

class MaintanancePageWeb extends StatefulWidget {
  DocumentWebModel? model;
  MaintanancePageWeb({
    super.key,
    this.model,
  });

  @override
  State<MaintanancePageWeb> createState() => _MaintanancePageWebState();
}

class _MaintanancePageWebState extends State<MaintanancePageWeb> {
  TextEditingController scheduleNumberController = TextEditingController();
  TextEditingController impectionNumberController = TextEditingController();
  TextEditingController policeNumberController = TextEditingController();
  TextEditingController vinController = TextEditingController();
  TextEditingController engineNumberController = TextEditingController();
  TextEditingController bodyNumberController = TextEditingController();
  TextEditingController modelNumberController = TextEditingController();
  TextEditingController jobTypeController = TextEditingController();
  TextEditingController houmeterController = TextEditingController();
  TextEditingController kilometerController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  TextEditingController customerController = TextEditingController();
  TextEditingController foremanController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  List<String> jobTypeList = ['tes1', 'tes2', 'tes3', 'tes4', 'tes5'];
  String? selectedJobTypeList;
  List<String> priorityTypeList = ['tes1', 'tes2', 'tes3', 'tes4', 'tes5'];
  String? selectedPriorityTypeList;
  List<String> customerTypeList = ['tes1', 'tes2', 'tes3', 'tes4', 'tes5'];
  String? selectedCustomerTypeList;
  List<String> foremanTypeList = ['tes1', 'tes2', 'tes3', 'tes4', 'tes5'];
  String? selectedForemanTypeList;
  List<String> statusTypeList = ['tes1', 'tes2', 'tes3', 'tes4', 'tes5'];
  String? selectedStatusTypeList;
  bool? inCreate = false;

  formValidate(BuildContext context) {
    var documentProvider =
        Provider.of<DocumentProvider>(context, listen: false);

    if (scheduleNumberController.text.isEmpty ||
        impectionNumberController.text.isEmpty ||
        policeNumberController.text.isEmpty ||
        vinController.text.isEmpty ||
        engineNumberController.text.isEmpty ||
        bodyNumberController.text.isEmpty ||
        modelNumberController.text.isEmpty ||
        jobTypeController.text.isEmpty ||
        houmeterController.text.isEmpty ||
        kilometerController.text.isEmpty ||
        priorityController.text.isEmpty ||
        customerController.text.isEmpty ||
        foremanController.text.isEmpty ||
        startDateController.text.isEmpty ||
        endDateController.text.isEmpty ||
        remarkController.text.isEmpty ||
        statusController.text.isEmpty) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (c) {
          return const ErrorDialog(
            message: 'Lengkapi form terlebih dahulu.',
          );
        },
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (c) {
          return const LoadingDialog(
            message: "Menambahkan Dokumen.",
          );
        },
      );

      String uniqueIdName = DateTime.now().millisecondsSinceEpoch.toString();

      documentProvider.addDocument(
        {
          'scheduleNumber': scheduleNumberController.text,
          'impectionNumber': impectionNumberController.text,
          'policeNumber': policeNumberController.text,
          'vin': vinController.text,
          'engineNumber': engineNumberController.text,
          'bodyNumber': bodyNumberController.text,
          'model': modelNumberController.text,
          'jobType': jobTypeController.text,
          'houmeter': houmeterController.text,
          'kilometer': kilometerController.text,
          'priority': priorityController.text,
          'customer': customerController.text,
          'foreman': foremanController.text,
          'startDate': DateTime.parse(startDateController.text),
          'endDate': DateTime.parse(endDateController.text),
          'remark': remarkController.text,
          'status': statusController.text,
          'createdTime': DateTime.now(),
          'documentID': uniqueIdName,
        },
        uniqueIdName.toString(),
      );

      Get.back();
      Get.back();

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (c) {
          return const SuccesDialog(
            message: 'Dokument berhasil ditambahkan.',
          );
        },
      );

      clearForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    var documentProvider =
        Provider.of<DocumentProvider>(context, listen: false);

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
            return const NullData(
              title: 'Upss Document Kosong!!',
              subtitle:
                  'Untuk saat ini dokumen masih kosong,\nSilahkan tambahkan dokumen.',
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                UniconsLine.filter,
                                color: Color(0xFF85A6C7),
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Schedule No',
                                style: blackTextStyle.copyWith(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const Icon(
                                UniconsLine.filter,
                                color: Color(0xFF85A6C7),
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Plate Number',
                                style: blackTextStyle.copyWith(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const Icon(
                                UniconsLine.filter,
                                color: Color(0xFF85A6C7),
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Vin',
                                style: blackTextStyle.copyWith(),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  UniconsLine.filter,
                                  color: Color(0xFF85A6C7),
                                  size: 18,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Model Year',
                                  style: blackTextStyle.copyWith(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const Icon(
                                UniconsLine.filter,
                                color: Color(0xFF85A6C7),
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Job Type',
                                style: blackTextStyle.copyWith(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const Icon(
                                UniconsLine.filter,
                                color: Color(0xFF85A6C7),
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Impection No',
                                style: blackTextStyle.copyWith(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const Icon(
                                UniconsLine.filter,
                                color: Color(0xFF85A6C7),
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Start Date',
                                style: blackTextStyle.copyWith(),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const Icon(
                                UniconsLine.filter,
                                color: Color(0xFF85A6C7),
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Status',
                                style: blackTextStyle.copyWith(),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                const Icon(
                                  UniconsLine.filter,
                                  color: Color(0xFF85A6C7),
                                  size: 18,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Action',
                                  style: blackTextStyle.copyWith(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentWebModel model = DocumentWebModel.fromJson(
                        snapshot.data!.docs[index].data()!
                            as Map<String, dynamic>);

                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 3,
                      ),
                      child: TableDocument(
                        model: model,
                        edit: () {
                          clearForm();
                          dialogEditDocument(
                            context,
                            model,
                            snapshot.data!.docs[index]['documentID'],
                          );
                        },
                        delete: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (c) {
                              return WarningDialog(
                                message:
                                    'Apakah anda yakin ingin menghapus data ini?',
                                mainButtonTitle: 'Hapus',
                                onTap: () {
                                  documentProvider.deleteDocument(
                                    snapshot.data!.docs[index]['documentID'],
                                  );
                                  Get.back();
                                },
                              );
                            },
                          );
                        },
                      ),
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
                    clearForm();
                    dialogAddDocument(context);
                    // Get.to(
                    //   const AddDocumentWebPage(),
                    // );
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

  clearForm() {
    setState(() {
      scheduleNumberController.clear();
      impectionNumberController.clear();
      policeNumberController.clear();
      vinController.clear();
      engineNumberController.clear();
      bodyNumberController.clear();
      modelNumberController.clear();
      jobTypeController.clear();
      houmeterController.clear();
      kilometerController.clear();
      priorityController.clear();
      customerController.clear();
      foremanController.clear();
      startDateController.clear();
      endDateController.clear();
      remarkController.clear();
      statusController.clear();
      selectedJobTypeList = null;
      selectedPriorityTypeList = null;
      selectedCustomerTypeList = null;
      selectedForemanTypeList = null;
      selectedStatusTypeList = null;
    });
  }

  dialogAddDocument(BuildContext context) {
    showGeneralDialog(
      barrierColor: Colors.black54,
      barrierDismissible: false,
      context: context,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (c, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeOutBack.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: FormDialog(
            onTapBack: () {
              Get.back();
            },
            title: 'Tambah Dokumen',
            contentDialog: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 35,
                ),
                formScheduleNumber(
                  scheduleNumberController,
                ),
                const SizedBox(
                  height: 15,
                ),
                formImpectionNumber(
                  impectionNumberController,
                ),
                const SizedBox(
                  height: 15,
                ),
                formPoliceNumber(
                  policeNumberController,
                ),
                const SizedBox(
                  height: 15,
                ),
                formVIN(
                  vinController,
                ),
                const SizedBox(
                  height: 15,
                ),
                formEngineNumber(
                  engineNumberController,
                ),
                const SizedBox(
                  height: 15,
                ),
                formBodyNumber(
                  bodyNumberController,
                ),
                const SizedBox(
                  height: 15,
                ),
                formModelNumber(
                  modelNumberController,
                ),
                const SizedBox(
                  height: 15,
                ),
                jobType(null),
                const SizedBox(
                  height: 15,
                ),
                formHoummeter(
                  houmeterController,
                ),
                const SizedBox(
                  height: 15,
                ),
                formKilometer(
                  kilometerController,
                ),
                const SizedBox(
                  height: 15,
                ),
                priority(null),
                const SizedBox(
                  height: 15,
                ),
                customer(null),
                const SizedBox(
                  height: 15,
                ),
                foreman(null),
                const SizedBox(
                  height: 15,
                ),
                startDate(context, null),
                const SizedBox(
                  height: 15,
                ),
                endDate(context, null),
                const SizedBox(
                  height: 15,
                ),
                remark(
                  remarkController,
                ),
                const SizedBox(
                  height: 15,
                ),
                status(null),
                const SizedBox(
                  height: 30,
                ),

                // BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: CustomButton(
                    bgColor: blueColor,
                    title: 'Simpan Dokumen',
                    onTap: () {
                      // updateObject(reportID);
                      formValidate(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  dialogEditDocument(
    BuildContext context,
    DocumentWebModel model,
    String documentID,
  ) {
    DocumentProvider documentProvider =
        Provider.of<DocumentProvider>(context, listen: false);
    Timestamp stampStart = model.startDate!;
    DateTime dateStart = stampStart.toDate();
    final startTime = DateFormat('yyy-MM-dd').format(dateStart);

    Timestamp stampEnd = model.endDate!;
    DateTime dateEnd = stampEnd.toDate();
    final dndTime = DateFormat('yyy-MM-dd').format(dateEnd);
    showGeneralDialog(
      barrierColor: Colors.black54,
      barrierDismissible: false,
      context: context,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (c, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeOutBack.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: FormDialog(
            onTapBack: () {
              Get.back();
            },
            title: 'Edit Dokumen',
            contentDialog: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 35,
                ),
                formScheduleNumber(
                  scheduleNumberController
                    ..text = scheduleNumberController.text.isEmpty
                        ? model.scheduleNumber!
                        : scheduleNumberController.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                formImpectionNumber(
                  impectionNumberController
                    ..text = impectionNumberController.text.isEmpty
                        ? model.impectionNumber!
                        : impectionNumberController.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                formPoliceNumber(
                  policeNumberController
                    ..text = policeNumberController.text.isEmpty
                        ? model.policeNumber!
                        : policeNumberController.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                formVIN(
                  vinController
                    ..text = vinController.text.isEmpty
                        ? model.vin!
                        : vinController.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                formEngineNumber(
                  engineNumberController
                    ..text = engineNumberController.text.isEmpty
                        ? model.engineNumber!
                        : engineNumberController.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                formBodyNumber(
                  bodyNumberController
                    ..text = bodyNumberController.text.isEmpty
                        ? model.bodyNumber!
                        : bodyNumberController.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                formModelNumber(
                  modelNumberController
                    ..text = modelNumberController.text.isEmpty
                        ? model.model!
                        : modelNumberController.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                jobType(model.jobType),
                const SizedBox(
                  height: 15,
                ),
                formHoummeter(
                  houmeterController
                    ..text = houmeterController.text.isEmpty
                        ? model.houmeter!
                        : houmeterController.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                formKilometer(
                  kilometerController
                    ..text = kilometerController.text.isEmpty
                        ? model.kilometer!
                        : kilometerController.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                priority(model.priority),
                const SizedBox(
                  height: 15,
                ),
                customer(model.customer),
                const SizedBox(
                  height: 15,
                ),
                foreman(model.foreman),
                const SizedBox(
                  height: 15,
                ),
                startDate(
                  context,
                  startTime.toString(),
                ),
                const SizedBox(
                  height: 15,
                ),
                endDate(context, dndTime),
                const SizedBox(
                  height: 15,
                ),
                remark(
                  remarkController
                    ..text = remarkController.text.isEmpty
                        ? model.remark!
                        : remarkController.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                status(model.status),
                const SizedBox(
                  height: 30,
                ),

                // BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: CustomButton(
                    bgColor: blueColor,
                    title: 'Simpan Perubahan',
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (c) {
                          return const LoadingDialog(
                            message: "Mengubah Dokumen.",
                          );
                        },
                      );
                      documentProvider.editDocument(
                        documentID,
                        {
                          'scheduleNumber': scheduleNumberController.text,
                          'impectionNumber': impectionNumberController.text,
                          'policeNumber': policeNumberController.text,
                          'vin': vinController.text,
                          'engineNumber': engineNumberController.text,
                          'bodyNumber': bodyNumberController.text,
                          'model': modelNumberController.text,
                          'jobType': selectedJobTypeList ?? model.jobType,
                          'houmeter': houmeterController.text,
                          'kilometer': kilometerController.text,
                          'priority':
                              selectedPriorityTypeList ?? model.priority,
                          'customer':
                              selectedCustomerTypeList ?? model.customer,
                          'foreman': selectedForemanTypeList ?? model.foreman,
                          'startDate': startDateController.text.isNotEmpty
                              ? DateTime.parse(startDateController.text)
                              : DateTime.parse(startTime),
                          'endDate': endDateController.text.isNotEmpty
                              ? DateTime.parse(endDateController.text)
                              : DateTime.parse(dndTime),
                          'remark': remarkController.text,
                          'status': selectedStatusTypeList ?? model.status,
                        },
                      );

                      Get.back();
                      Get.back();

                      clearForm();

                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (c) {
                          return const SuccesDialog(
                            message: 'Dokument berhasil diubah.',
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget formScheduleNumber(TextEditingController textEditingController) {
    return FormWidget(
      title: 'Schedule Number',
      textEditingController: textEditingController,
      hintText: 'Masukkan schedule number...',
    );
  }

  Widget formImpectionNumber(TextEditingController textEditingController) {
    return FormWidget(
      title: 'Inspection Number',
      textEditingController: textEditingController,
      hintText: 'Masukkan inspection number...',
    );
  }

  Widget formPoliceNumber(TextEditingController textEditingController) {
    return FormWidget(
      title: 'Police Number',
      textEditingController: textEditingController,
      hintText: 'Masukkan police number...',
    );
  }

  Widget formVIN(TextEditingController textEditingController) {
    return FormWidget(
      title: 'VIN',
      textEditingController: textEditingController,
      hintText: 'Masukkan VIN...',
    );
  }

  Widget formEngineNumber(TextEditingController textEditingController) {
    return FormWidget(
      title: 'Engine Number',
      textEditingController: textEditingController,
      hintText: 'Masukkan engine number...',
    );
  }

  Widget formBodyNumber(TextEditingController textEditingController) {
    return FormWidget(
      title: 'Body Number',
      textEditingController: textEditingController,
      hintText: 'Masukkan body number...',
    );
  }

  Widget formModelNumber(TextEditingController textEditingController) {
    return FormWidget(
      title: 'Model Number',
      textEditingController: textEditingController,
      hintText: 'Masukkan model number...',
    );
  }

  Widget jobType(String? title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          'Job Type',
          style: textStyle.copyWith(
            fontSize: 16,
            color: blackColor,
          ),
        ),

        const SizedBox(
          height: 6,
        ),

        // TextField
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F0F5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton(
            isExpanded: true,
            dropdownColor: whiteColor,
            iconSize: 20,
            underline: const SizedBox(),
            hint: Text(
              title ?? "Job Type",
              style: title != null ? blackTextStyle : greyTextStyle.copyWith(),
            ),
            value: selectedJobTypeList,
            items: jobTypeList.map(
              (e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: blackTextStyle.copyWith(),
                  ),
                );
              },
            ).toList(),
            onChanged: (newValue) {
              setState(
                () {
                  selectedJobTypeList = newValue.toString();
                  jobTypeController.text = newValue.toString();
                },
              );
            },
            focusColor: const Color(0xFF707070),
          ),
        ),
      ],
    );
  }

  Widget formHoummeter(TextEditingController textEditingController) {
    return FormWidget(
      title: 'Hoummeter',
      textEditingController: textEditingController,
      hintText: 'Masukkan hoummeter...',
    );
  }

  Widget formKilometer(TextEditingController textEditingController) {
    return FormWidget(
      title: 'Kilometer',
      textEditingController: textEditingController,
      hintText: 'Masukkan Kilometer...',
    );
  }

  Widget priority(String? title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          'Priority',
          style: textStyle.copyWith(
            fontSize: 16,
            color: blackColor,
          ),
        ),

        const SizedBox(
          height: 6,
        ),

        // TextField
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F0F5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton(
            isExpanded: true,
            dropdownColor: whiteColor,
            iconSize: 20,
            underline: const SizedBox(),
            hint: Text(
              title ?? "Priority",
              style: title != null ? blackTextStyle : greyTextStyle.copyWith(),
            ),
            value: selectedPriorityTypeList,
            items: priorityTypeList.map(
              (e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: blackTextStyle.copyWith(),
                  ),
                );
              },
            ).toList(),
            onChanged: (newValue) {
              setState(
                () {
                  selectedPriorityTypeList = newValue.toString();
                  priorityController.text = newValue.toString();
                },
              );
            },
            focusColor: const Color(0xFF707070),
          ),
        ),
      ],
    );
  }

  Widget customer(String? title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          'Customer',
          style: textStyle.copyWith(
            fontSize: 16,
            color: blackColor,
          ),
        ),

        const SizedBox(
          height: 6,
        ),

        // TextField
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F0F5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton(
            isExpanded: true,
            dropdownColor: whiteColor,
            iconSize: 20,
            underline: const SizedBox(),
            hint: Text(
              title ?? "Select Customer",
              style: title != null ? blackTextStyle : greyTextStyle.copyWith(),
            ),
            value: selectedCustomerTypeList,
            items: customerTypeList.map(
              (e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: blackTextStyle.copyWith(),
                  ),
                );
              },
            ).toList(),
            onChanged: (newValue) {
              setState(
                () {
                  selectedCustomerTypeList = newValue.toString();
                  customerController.text = newValue.toString();
                },
              );
            },
            focusColor: const Color(0xFF707070),
          ),
        ),
      ],
    );
  }

  Widget foreman(String? title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          'Foreman',
          style: textStyle.copyWith(
            fontSize: 16,
            color: blackColor,
          ),
        ),

        const SizedBox(
          height: 6,
        ),

        // TextField
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F0F5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton(
            isExpanded: true,
            dropdownColor: whiteColor,
            iconSize: 20,
            underline: const SizedBox(),
            hint: Text(
              title ?? "Foreman",
              style: title != null ? blackTextStyle : greyTextStyle.copyWith(),
            ),
            value: selectedForemanTypeList,
            items: foremanTypeList.map(
              (e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: blackTextStyle.copyWith(),
                  ),
                );
              },
            ).toList(),
            onChanged: (newValue) {
              setState(
                () {
                  selectedForemanTypeList = newValue.toString();
                  foremanController.text = newValue.toString();
                },
              );
            },
            focusColor: const Color(0xFF707070),
          ),
        ),
      ],
    );
  }

  Widget startDate(BuildContext context, String? startDate) {
    return GestureDetector(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2021),
          lastDate: DateTime(2040),
        ).then(
          (date) {
            setState(
              () {
                startDateController.text = date != null
                    ? DateFormat('yyy-MM-dd').format(date as DateTime)
                    : '';
              },
            );
          },
        );
      },
      child: FormWidget(
        title: 'Start Date',
        textEditingController: startDateController,
        hintText: startDate ?? 'Select start date',
        colorHintText: startDate != null ? blackColor : greyColor,
        enabled: false,
      ),
    );
  }

  Widget endDate(BuildContext context, String? endTime) {
    return GestureDetector(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2021),
          lastDate: DateTime(2040),
        ).then(
          (date) {
            setState(
              () {
                endDateController.text = date != null
                    ? DateFormat('yyy-MM-dd').format(date as DateTime)
                    : '';
              },
            );
          },
        );
      },
      child: FormWidget(
        title: 'End Date',
        textEditingController: endDateController,
        hintText: endTime ?? 'Select end date',
        colorHintText: endTime != null ? blackColor : greyColor,
        enabled: false,
      ),
    );
  }

  Widget remark(TextEditingController textEditingController) {
    return FormWidget(
      title: 'Remark',
      textEditingController: textEditingController,
      hintText: 'Masukkan remark...',
    );
  }

  Widget status(String? title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          'Status',
          style: textStyle.copyWith(
            fontSize: 16,
            color: blackColor,
          ),
        ),

        const SizedBox(
          height: 6,
        ),

        // TextField
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F0F5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton(
            isExpanded: true,
            dropdownColor: whiteColor,
            iconSize: 20,
            underline: const SizedBox(),
            hint: Text(
              title ?? "Status",
              style: title != null ? blackTextStyle : greyTextStyle.copyWith(),
            ),
            value: selectedStatusTypeList,
            items: statusTypeList.map(
              (e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: blackTextStyle.copyWith(),
                  ),
                );
              },
            ).toList(),
            onChanged: (newValue) {
              setState(
                () {
                  selectedStatusTypeList = newValue.toString();
                  statusController.text = newValue.toString();
                },
              );
            },
            focusColor: const Color(0xFF707070),
          ),
        ),
      ],
    );
  }
}
