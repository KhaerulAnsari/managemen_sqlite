// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:managemen_sqlite/database/document_database.dart';
import 'package:managemen_sqlite/model/document.dart';
import 'package:managemen_sqlite/theme.dart';
import 'package:managemen_sqlite/ui/widgets/custom_button.dart';
import 'package:managemen_sqlite/ui/widgets/form_widgets.dart';
import 'package:managemen_sqlite/ui/widgets/succes_dialog.dart';

class EditDocumentPage extends StatefulWidget {
  Document? document;
  EditDocumentPage({super.key, this.document});

  @override
  State<EditDocumentPage> createState() => _EditDocumentPageState();
}

class _EditDocumentPageState extends State<EditDocumentPage> {
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

  @override
  Widget build(BuildContext context) {
    final startTime =
        DateFormat('yyy-MM-dd').format(widget.document!.startDate!);
    final endTime = DateFormat('yyy-MM-dd').format(widget.document!.endDate!);

    Widget formScheduleNumber() {
      return FormWidget(
        title: 'Schedule Number',
        textEditingController: scheduleNumberController
          ..text = widget.document!.scheduleNumber!,
        hintText: 'Masukkan schedule number...',
      );
    }

    Widget formImpectionNumber() {
      return FormWidget(
        title: 'Inspection Number',
        textEditingController: impectionNumberController
          ..text = widget.document!.impectionNumber.toString(),
        hintText: 'Masukkan inspection number...',
      );
    }

    Widget formPoliceNumber() {
      return FormWidget(
        title: 'Police Number',
        textEditingController: policeNumberController
          ..text = widget.document!.policeNumber!,
        hintText: 'Masukkan police number...',
      );
    }

    Widget formVIN() {
      return FormWidget(
        title: 'VIN',
        textEditingController: vinController..text = widget.document!.vin!,
        hintText: 'Masukkan VIN...',
      );
    }

    Widget formEngineNumber() {
      return FormWidget(
        title: 'Engine Number',
        textEditingController: engineNumberController
          ..text = widget.document!.engineNumber!,
        hintText: 'Masukkan engine number...',
      );
    }

    Widget formBodyNumber() {
      return FormWidget(
        title: 'Body Number',
        textEditingController: bodyNumberController
          ..text = widget.document!.bodyNumber!,
        hintText: 'Masukkan body number...',
      );
    }

    Widget formModelNumber() {
      return FormWidget(
        title: 'Model Number',
        textEditingController: modelNumberController
          ..text = widget.document!.model!,
        hintText: 'Masukkan model number...',
      );
    }

    Widget jobType() {
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
                widget.document!.jobType!,
                style: blackTextStyle.copyWith(),
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
                  },
                );
              },
              focusColor: const Color(0xFF707070),
            ),
          ),
        ],
      );
    }

    Widget formHoummeter() {
      return FormWidget(
        title: 'Hoummeter',
        textEditingController: houmeterController
          ..text = widget.document!.houmeter!,
        hintText: 'Masukkan hoummeter...',
      );
    }

    Widget formKilometer() {
      return FormWidget(
        title: 'Kilometer',
        textEditingController: kilometerController
          ..text = widget.document!.kilometer!,
        hintText: 'Masukkan Kilometer...',
      );
    }

    Widget priority() {
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
                widget.document!.priority!,
                style: blackTextStyle.copyWith(),
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
                  },
                );
              },
              focusColor: const Color(0xFF707070),
            ),
          ),
        ],
      );
    }

    Widget customer() {
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
                widget.document!.customer!,
                style: blackTextStyle.copyWith(),
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
                  },
                );
              },
              focusColor: const Color(0xFF707070),
            ),
          ),
        ],
      );
    }

    Widget foreman() {
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
                widget.document!.foreman!,
                style: blackTextStyle.copyWith(),
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
                  },
                );
              },
              focusColor: const Color(0xFF707070),
            ),
          ),
        ],
      );
    }

    Widget startDate() {
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
          hintText: startTime,
          colorHintText: blackColor,
          enabled: false,
        ),
      );
    }

    Widget endDate() {
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
          hintText: endTime,
          colorHintText: blackColor,
          enabled: false,
        ),
      );
    }

    Widget remark() {
      return FormWidget(
        title: 'Remark',
        textEditingController: remarkController
          ..text = widget.document!.remark!,
        hintText: 'Masukkan remark...',
      );
    }

    Widget status() {
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
                widget.document!.status!,
                style: blackTextStyle.copyWith(),
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
                  },
                );
              },
              focusColor: const Color(0xFF707070),
            ),
          ),
        ],
      );
    }

    Widget customButton() {
      return SizedBox(
        width: double.infinity,
        height: 45,
        child: CustomButton(
          title: 'Simpan Perubahan',
          onTap: () {
            editDocument();

            Navigator.of(context).pop();
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (c) {
                return const SuccesDialog(
                  message:
                      'Dokument berhasil diubah.\nSilahkan refresh halaman ini.',
                );
              },
            );
          },
        ),
      );
    }

    Widget header() {
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
              'Edit Schedule',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: medium,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                header(),
                const SizedBox(
                  height: 35,
                ),
                formScheduleNumber(),
                const SizedBox(
                  height: 15,
                ),
                formImpectionNumber(),
                const SizedBox(
                  height: 15,
                ),
                formPoliceNumber(),
                const SizedBox(
                  height: 15,
                ),
                formVIN(),
                const SizedBox(
                  height: 15,
                ),
                formEngineNumber(),
                const SizedBox(
                  height: 15,
                ),
                formBodyNumber(),
                const SizedBox(
                  height: 15,
                ),
                formModelNumber(),
                const SizedBox(
                  height: 15,
                ),
                jobType(),
                const SizedBox(
                  height: 15,
                ),
                formHoummeter(),
                const SizedBox(
                  height: 15,
                ),
                formKilometer(),
                const SizedBox(
                  height: 15,
                ),
                priority(),
                const SizedBox(
                  height: 15,
                ),
                customer(),
                const SizedBox(
                  height: 15,
                ),
                foreman(),
                const SizedBox(
                  height: 15,
                ),
                startDate(),
                const SizedBox(
                  height: 15,
                ),
                endDate(),
                const SizedBox(
                  height: 15,
                ),
                remark(),
                const SizedBox(
                  height: 15,
                ),
                status(),
                const SizedBox(
                  height: 30,
                ),
                customButton(),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future editDocument() async {
    final startTime =
        DateFormat('yyy-MM-dd').format(widget.document!.startDate!);
    final endTime = DateFormat('yyy-MM-dd').format(widget.document!.endDate!);

    final document = widget.document!.copy(
      scheduleNumber: scheduleNumberController.text,
      impectionNumber: impectionNumberController.text,
      policeNumber: policeNumberController.text,
      vin: vinController.text,
      engineNumber: engineNumberController.text,
      bodyNumber: bodyNumberController.text,
      model: modelNumberController.text,
      jobType: selectedJobTypeList ?? widget.document!.jobType,
      houmeter: houmeterController.text,
      kilometer: kilometerController.text,
      priority: selectedPriorityTypeList ?? widget.document!.priority,
      customer: selectedCustomerTypeList ?? widget.document!.customer,
      foreman: selectedForemanTypeList ?? widget.document!.foreman,
      startDate: startDateController.text.isNotEmpty
          ? DateTime.parse(startDateController.text)
          : DateTime.parse(startTime),
      endDate: endDateController.text.isNotEmpty
          ? DateTime.parse(endDateController.text)
          : DateTime.parse(endTime),
      remark: remarkController.text,
      status: selectedStatusTypeList ?? widget.document!.status,
      createdTime: DateTime.now(),
    );

    await DocumentDatabase.instance.update(document);
  }
}
