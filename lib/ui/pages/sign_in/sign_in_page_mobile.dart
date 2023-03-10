import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managemen_sqlite/global/gobal.dart';
import 'package:managemen_sqlite/theme.dart';
import 'package:managemen_sqlite/ui/pages/home_page.dart';
import 'package:managemen_sqlite/ui/pages/main_page_web/main_page_web.dart';
import 'package:managemen_sqlite/ui/widgets/custom_button.dart';
import 'package:managemen_sqlite/ui/widgets/form_widgets.dart';
import 'package:managemen_sqlite/ui/widgets/snackbar_box.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SignInPageMobile extends StatefulWidget {
  @override
  _SignInPageMobileState createState() => _SignInPageMobileState();
}

class _SignInPageMobileState extends State<SignInPageMobile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isVisible = false;
  bool _islogin = false;

  formFalidation() {
    if (emailController.text.isEmpty && emailController.text.isEmpty) {
      return snackbarBox(
        'Masukkan email atau password terlebih dahulu',
      );
    } else if (!EmailValidator.validate(emailController.text)) {
      return snackbarBox(
        'Format email tidak sesuai',
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
          snackbarBox("Email atau password salah.");
        },
      );
    } on FirebaseException catch (e) {
      snackbarBox("error");
    }

    // CHECK USER
    if (currentUser != null) {
      if (kIsWeb) {
        Get.to(
          const MainPageWeb(),
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
      return kIsWeb
          ? Text(
              'Welcome Back,\nSign In',
              style: blackTextStyle.copyWith(
                fontSize: 26,
                fontWeight: bold,
              ),
            )
          : Text(
              'Login',
              style: blackTextStyle.copyWith(
                fontSize: 22,
                fontWeight: semiBold,
              ),
            );
    }

    Widget image() {
      return Center(
        child: Image.asset(
          'images/hino.png',
          height: 200,
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
        padding: EdgeInsets.all(defaultMargin),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 31,
              ),
              title(),
              const SizedBox(
                height: 24,
              ),
              image(),
              const SizedBox(
                height: 20,
              ),
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
      ),
    );
  }
}
