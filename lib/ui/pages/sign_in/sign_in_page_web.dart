import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managemen_sqlite/global/gobal.dart';
import 'package:managemen_sqlite/theme.dart';
import 'package:managemen_sqlite/ui/pages/home_page.dart';
import 'package:managemen_sqlite/ui/pages/main_page_web.dart';
import 'package:managemen_sqlite/ui/widgets/custom_button.dart';
import 'package:managemen_sqlite/ui/widgets/error_dialog.dart';
import 'package:managemen_sqlite/ui/widgets/form_widgets.dart';
import 'package:managemen_sqlite/ui/widgets/snackbar_box.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SignInPageWeb extends StatefulWidget {
  final double? margin;

  SignInPageWeb({this.margin});

  @override
  _SignInPageWebState createState() => _SignInPageWebState();
}

class _SignInPageWebState extends State<SignInPageWeb> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isVisible = false;
  bool _islogin = false;

  formFalidation() {
    if (emailController.text.isEmpty && emailController.text.isEmpty) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (c) {
          return const ErrorDialog(
            message: 'Masukkan email atau password anda.',
          );
        },
      );
    } else if (!EmailValidator.validate(emailController.text)) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (c) {
          return const ErrorDialog(
            message: 'Format email tidak didikung.',
          );
        },
      );
    } else {
      loginNow();
    }
  }

  loginNow() async {
    setState(() {
      _islogin = true;
    });

    User? currentUser;

    try {
      await firebaseAuth
          .signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((auth) {
        currentUser = auth.user!;
      }).catchError(
        (error) {
          setState(() {
            _islogin = false;
          });
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (c) {
              return const ErrorDialog(
                message: 'Email atau Password salah.',
              );
            },
          );
          // snackbarBox("Email atau password salah.");
        },
      );
    } on FirebaseException catch (e) {
      snackbarBox("error");
    }

    // CHECK USER
    if (currentUser != null) {
      if (kIsWeb) {
        Get.to(
          MainPageWeb(),
        );
      } else {
        Get.offAll(
          const HomePage(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Text(
        'Welcome Back,\nSign In',
        style: blackTextStyle.copyWith(
          fontSize: 26,
          fontWeight: bold,
        ),
      );
    }

    Widget image() {
      return Center(
        child: Image.asset(
          'images/signin_web.png',
          height: 350,
        ),
      );
    }

    Widget formemail() {
      return FormWidget(
        title: 'Email',
        textEditingController: emailController,
        hintText: 'Masukkan email...',
      );
    }

    Widget password() {
      return FormWidget(
        title: 'Password',
        textEditingController: passwordController,
        hintText: 'Masukkan password...',
        obscureText: !_isVisible,
        widget: IconButton(
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          icon: !_isVisible
              ? const Icon(
                  Icons.visibility_off,
                  color: Colors.grey,
                )
              : Icon(
                  Icons.visibility,
                  color: blueColor,
                ),
        ),
      );
    }

    Widget buttonLogin() {
      return _islogin
          ? Center(
              child: SizedBox(
                height: 35,
                width: 35,
                child: CircularProgressIndicator(
                  color: blueColor,
                ),
              ),
            )
          : SizedBox(
              width: double.infinity,
              height: 45,
              child: CustomButton(
                title: 'Login',
                onTap: () {
                  formFalidation();
                },
              ),
            );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widget.margin ?? 150,
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 31,
                ),
                title(),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: image(),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          formemail(),
                          const SizedBox(
                            height: 14,
                          ),
                          password(),
                          const SizedBox(
                            height: 30,
                          ),
                          buttonLogin(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
