import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managemen_sqlite/global/gobal.dart';
import 'package:managemen_sqlite/theme.dart';
import 'package:managemen_sqlite/ui/pages/sign_in/sign_in_page_web.dart';
import 'package:managemen_sqlite/ui/pages/web/car_page_web.dart';
import 'package:managemen_sqlite/ui/pages/web/chart_page_web.dart';
import 'package:managemen_sqlite/ui/pages/web/home_page_web.dart';
import 'package:managemen_sqlite/ui/pages/web/maintanance_page_web.dart';
import 'package:managemen_sqlite/ui/pages/web/notes_page_web.dart';
import 'package:managemen_sqlite/ui/widgets/warning_dialog.dart';
import 'package:unicons/unicons.dart';

class MainPageWeb extends StatefulWidget {
  const MainPageWeb({super.key});

  @override
  State<MainPageWeb> createState() => _MainPageWebState();
}

class _MainPageWebState extends State<MainPageWeb> {
  TabController? controller;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void logOut() {
      firebaseAuth.signOut();
      Get.offAll(SignInPageWeb());
    }

    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF1),
      appBar: AppBar(
        backgroundColor: blueColor,
        title: Text(
          'On-Site Service System',
          style: whiteTextStyle.copyWith(
            fontSize: 24,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
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
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: const Color(0xFFDDE7F1),
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: [
              NavigationRailDestination(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                ),
                icon: Icon(
                  UniconsLine.estate,
                  color: greyColor,
                ),
                selectedIcon: Container(
                  color: const Color(0xFFD5DEE7),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: const Icon(
                    UniconsLine.estate,
                    color: Color(0xFF065AB0),
                  ),
                ),
                label: const Text(''),
              ),
              NavigationRailDestination(
                icon: Icon(
                  UniconsLine.wrench,
                  color: greyColor,
                ),
                selectedIcon: Container(
                  color: const Color(0xFFD5DEE7),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: const Icon(
                    UniconsLine.wrench,
                    color: Color(0xFF065AB0),
                  ),
                ),
                label: const Text(''),
              ),
              NavigationRailDestination(
                icon: Icon(
                  UniconsLine.comparison,
                  color: greyColor,
                ),
                selectedIcon: Container(
                  color: const Color(0xFFD5DEE7),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: const Icon(
                    UniconsLine.comparison,
                    color: Color(0xFF065AB0),
                  ),
                ),
                label: const Text(''),
              ),
              NavigationRailDestination(
                icon: Icon(
                  UniconsLine.car,
                  color: greyColor,
                ),
                selectedIcon: Container(
                  color: const Color(0xFFD5DEE7),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: const Icon(
                    UniconsLine.car,
                    color: Color(0xFF065AB0),
                  ),
                ),
                label: const Text(''),
              ),
              NavigationRailDestination(
                icon: Icon(
                  UniconsLine.clipboard_alt,
                  color: greyColor,
                ),
                selectedIcon: Container(
                  color: const Color(0xFFD5DEE7),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: const Icon(
                    UniconsLine.clipboard_alt,
                    color: Color(0xFF065AB0),
                  ),
                ),
                label: const Text(''),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: body(),
          )
        ],
      ),
    );
  }

  Widget body() {
    switch (_selectedIndex) {
      case 0:
        return const HomePageWeb();
      case 1:
        return MaintanancePageWeb();
      case 2:
        return const ChartPageWeb();
      case 3:
        return const CarPageWeb();
      case 4:
        return const NotesPageWeb();

      default:
        return const HomePageWeb();
    }
  }
}
