import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:managemen_sqlite/database/document_database.dart';
import 'package:managemen_sqlite/model/document.dart';
import 'package:managemen_sqlite/service/document_service.dart';
import 'package:managemen_sqlite/theme.dart';
import 'package:managemen_sqlite/ui/widgets/custom_button.dart';
import 'package:managemen_sqlite/ui/widgets/form_widgets.dart';
import 'package:managemen_sqlite/ui/widgets/loading_dialog.dart';
import 'package:managemen_sqlite/ui/widgets/snackbar_box.dart';
import 'package:managemen_sqlite/ui/widgets/succes_dialog.dart';
import 'package:provider/provider.dart';

class AddDocumentWebPage extends StatefulWidget {
  const AddDocumentWebPage({super.key});

  @override
  State<AddDocumentWebPage> createState() => _AddDocumentWebPageState();
}

class _AddDocumentWebPageState extends State<AddDocumentWebPage> {
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
    var documentProvider =
        Provider.of<DocumentProvider>(context, listen: false);

    formValidate() {
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
        return snackbarBox('Lengkapi form terlebih dahulu.');
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

        documentProvider.addDocument({
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
        });

        Get.back();
        Get.back();

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (c) {
            return const SuccesDialog(
              message:
                  'Dokument berhasil ditambahkan.\nSilahkan refresh halaman ini.',
            );
          },
        );
      }
    }

    Widget formScheduleNumber() {
      return FormWidget(
        title: 'Schedule Number',
        textEditingController: scheduleNumberController,
        hintText: 'Masukkan schedule number...',
      );
    }

    Widget formImpectionNumber() {
      return FormWidget(
        title: 'Inspection Number',
        textEditingController: impectionNumberController,
        hintText: 'Masukkan inspection number...',
      );
    }

    Widget formPoliceNumber() {
      return FormWidget(
        title: 'Police Number',
        textEditingController: policeNumberController,
        hintText: 'Masukkan police number...',
      );
    }

    Widget formVIN() {
      return FormWidget(
        title: 'VIN',
        textEditingController: vinController,
        hintText: 'Masukkan VIN...',
      );
    }

    Widget formEngineNumber() {
      return FormWidget(
        title: 'Engine Number',
        textEditingController: engineNumberController,
        hintText: 'Masukkan engine number...',
      );
    }

    Widget formBodyNumber() {
      return FormWidget(
        title: 'Body Number',
        textEditingController: bodyNumberController,
        hintText: 'Masukkan body number...',
      );
    }

    Widget formModelNumber() {
      return FormWidget(
        title: 'Model Number',
        textEditingController: modelNumberController,
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
                "Job Type",
                style: greyTextStyle.copyWith(),
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

    Widget formHoummeter() {
      return FormWidget(
        title: 'Hoummeter',
        textEditingController: houmeterController,
        hintText: 'Masukkan hoummeter...',
      );
    }

    Widget formKilometer() {
      return FormWidget(
        title: 'Kilometer',
        textEditingController: kilometerController,
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
                "Priority",
                style: greyTextStyle.copyWith(),
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
                "Select Customer",
                style: greyTextStyle.copyWith(),
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
                "Foreman",
                style: greyTextStyle.copyWith(),
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
          hintText: 'Select start date',
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
          hintText: 'Select end date',
          enabled: false,
        ),
      );
    }

    Widget remark() {
      return FormWidget(
        title: 'Remark',
        textEditingController: remarkController,
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
                "Status",
                style: greyTextStyle.copyWith(),
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

    Widget customButton() {
      return SizedBox(
        width: double.infinity,
        height: 45,
        child: CustomButton(
          title: 'Simpan Data',
          onTap: () {
            formValidate();
          },
        ),
      );
    }

    Widget textHeader() {
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
              'Maintanance Schedule',
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
                textHeader(),
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

  Future addDocument() async {
    final document = Document(
      scheduleNumber: scheduleNumberController.text,
      impectionNumber: impectionNumberController.text,
      policeNumber: policeNumberController.text,
      vin: vinController.text,
      engineNumber: engineNumberController.text,
      bodyNumber: bodyNumberController.text,
      model: modelNumberController.text,
      jobType: jobTypeController.text,
      houmeter: houmeterController.text,
      kilometer: kilometerController.text,
      priority: priorityController.text,
      customer: customerController.text,
      foreman: foremanController.text,
      startDate: DateTime.parse(startDateController.text),
      endDate: DateTime.parse(endDateController.text),
      remark: remarkController.text,
      status: statusController.text,
      createdTime: DateTime.now(),
    );

    await DocumentDatabase.instance.create(document);
  }
}
