import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managemen_sqlite/theme.dart';
import 'package:unicons/unicons.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: blueColor,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Column(
            children: [
              // Button Close
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Center(
                      child: Image.asset(
                        'images/hino.png',
                        width: 250,
                      ),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    color: whiteColor,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),

              const SizedBox(
                height: 30,
              ),

              const SizedBox(
                height: 20,
              ),

              // Notification
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      UniconsLine.wrench,
                      color: greyColor,
                    ),
                    const SizedBox(width: 9),
                    Text(
                      "Maintanance",
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              // About
              GestureDetector(
                onTap: () {
                  // Action
                },
                child: Row(
                  children: [
                    Icon(
                      UniconsLine.comparison,
                      color: greyColor,
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Text(
                      "Grafik",
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              // About
              GestureDetector(
                onTap: () {
                  // Action
                },
                child: Row(
                  children: [
                    Icon(
                      UniconsLine.car,
                      color: greyColor,
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Text(
                      "Car",
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              // About
              GestureDetector(
                onTap: () {
                  // Action
                },
                child: Row(
                  children: [
                    Icon(
                      UniconsLine.clipboard_alt,
                      color: greyColor,
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Text(
                      "Catatan",
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Log Out
              GestureDetector(
                onTap: () {
                  // Action
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: whiteColor,
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    Text(
                      "Log Out",
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              //
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
