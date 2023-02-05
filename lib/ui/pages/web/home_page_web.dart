// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managemen_sqlite/theme.dart';
import 'package:managemen_sqlite/ui/pages/web/add_document_web_page.dart';
import 'package:managemen_sqlite/ui/widgets/custom_button.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({super.key});

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  bool? inCreate = false;

  @override
  Widget build(BuildContext context) {
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
                    setState(() {
                      inCreate = !inCreate!;
                    });
                  },
                ),
              ),
            ],
          ),
          inCreate == true ? const Text('Hallo') : SizedBox(),
        ],
      ),
    );
  }
}
