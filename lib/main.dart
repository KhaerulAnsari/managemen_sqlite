import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:managemen_sqlite/global/gobal.dart';
import 'package:managemen_sqlite/service/document_service.dart';
import 'package:managemen_sqlite/ui/pages/home_page.dart';
import 'package:managemen_sqlite/ui/pages/sign_in/sign_in_page.dart';
import 'package:managemen_sqlite/ui/pages/sign_in/sign_in_page_mobile.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:managemen_sqlite/ui/pages/main_page_web.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBVYomZnEjU4xbBg3w-ultGsDsWqiaJ-jg',
        appId: '1:279272138238:web:d379fc3a675d1644738caf',
        messagingSenderId: '279272138238',
        projectId: 'manajement-989f1',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DocumentProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: kIsWeb
            ? firebaseAuth.currentUser != null
                ? const MainPageWeb()
                : const SignInPage()
            : firebaseAuth.currentUser != null
                ? const HomePage()
                : SignInPageMobile(),
      ),
    );
  }
}
