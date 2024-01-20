import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/core/controller/controller.dart';
import 'package:flutter_test_muhammad_riski/core/helper/route_helper.dart';
import 'package:flutter_test_muhammad_riski/core/helper/validation_page_helper.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_color.dart';
import 'package:flutter_test_muhammad_riski/feature/contact/presentation/controller/contact_controller.dart';
import 'package:flutter_test_muhammad_riski/feature/contact/presentation/page/main_page_contact.dart';
import 'package:flutter_test_muhammad_riski/feature/signup/presentation/controller/signup_controller.dart';
import 'package:flutter_test_muhammad_riski/feature/signup/presentation/page/main_page_verification_code.dart';
import 'package:get/get.dart';

import 'feature/signup/presentation/page/main_page_signup.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseAuth.instanceFor(app: app);
  runApp(BionicTestApp());
}

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<SignupController>(() => SignupController());
    Get.lazyPut<ContactController>(() => ContactController(), fenix: true);
  }
}

class BionicTestApp extends StatelessWidget {
  const BionicTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: routeHelper.initial,
      getPages: [
        GetPage(
          name: routeHelper.toVerificationNumbeCode,
          page: () => MainVerificationCode(),
        ),
        GetPage(
          name: routeHelper.toSignUp,
          page: () => MainPageSignUp(),
        ),
        GetPage(
          name: routeHelper.toContact,
          page: () => MianPageContact(),
        ),
      ],
      theme: ThemeData(
          scaffoldBackgroundColor: BionicColors.primaryColorDark,
          fontFamily: 'archivo',
          appBarTheme: AppBarTheme(
              backgroundColor: BionicColors.primaryColorDark,
              iconTheme: IconThemeData(
                color: BionicColors.white,
              ))),
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
              devicePixelRatio: MediaQuery.of(context).devicePixelRatio),
          child: child!),
      initialBinding: InitialBindings(),
      home: InitialApp(),
    );
  }
}

class InitialApp extends StatelessWidget {
  const InitialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValidationPage();
  }
}
