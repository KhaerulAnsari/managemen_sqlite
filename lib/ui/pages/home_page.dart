import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:managemen_sqlite/global/gobal.dart';
import 'package:managemen_sqlite/theme.dart';
import 'package:managemen_sqlite/ui/pages/car_page.dart';
import 'package:managemen_sqlite/ui/pages/chart_page.dart';
import 'package:managemen_sqlite/ui/pages/document_page.dart';
import 'package:managemen_sqlite/ui/pages/notes_page.dart';
import 'package:managemen_sqlite/ui/widgets/custom_card_menu.dart';
import 'package:managemen_sqlite/ui/widgets/warning_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logOut() {
    firebaseAuth.signOut();
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Text(
        'Halo,\nSelamat Datang Kembali',
        style: blackTextStyle.copyWith(
          fontSize: 24,
          fontWeight: bold,
        ),
      );
    }

    Widget menuItem() {
      return Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          CustomCardMenu(
            title: 'Maintanance',
            imageUrl: 'images/repair.png',
            onTap: () {
              Get.to(
                const DocumentPage(),
              );
            },
          ),
          CustomCardMenu(
            title: 'Notes',
            imageUrl: 'images/papers.png',
            onTap: () {
              Get.to(
                const NotesPage(),
              );
            },
          ),
          CustomCardMenu(
            title: 'Car',
            imageUrl: 'images/icon_car.png',
            onTap: () {
              Get.to(
                const CarPage(),
              );
            },
          ),
          CustomCardMenu(
            title: 'Chart',
            imageUrl: 'images/charts.png',
            onTap: () {
              Get.to(
                const ChartPage(),
              );
            },
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: blueColor,
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (c) {
                return WarningDialog(
                  message: 'Apakah anda yakin ingin keluar?',
                  mainButtonTitle: 'Keluar',
                  onTap: () {
                    logOut();
                  },
                );
              },
            );
          },
          child: Icon(
            Icons.logout,
            color: whiteColor,
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'images/repairing.png',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  header(),
                  const SizedBox(
                    height: 40,
                  ),
                  menuItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
