// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:managemen_sqlite/ui/pages/sign_in/sign_in_page_mobile.dart';
import 'package:managemen_sqlite/ui/pages/sign_in/sign_in_page_web.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 700) {
        return SignInPageMobile();
      } else if (constraints.maxWidth <= 1000) {
        return SignInPageWeb(
          margin: 60,
          // heightImage: 300,
          // widthImage: 300,
        );
      } else {
        return SignInPageWeb(
            // margin: 200,
            // heightImage: 350,
            // widthImage: 350,
            );
      }
    });
  }
}
