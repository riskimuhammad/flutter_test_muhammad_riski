import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/core/helper/route_helper.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_color.dart';
import 'package:flutter_test_muhammad_riski/feature/signup/presentation/controller/signup_controller.dart';
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
    Get.lazyPut<SignupController>(() => SignupController());
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
          page: () => MainPageSignUp(),
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
    return MainPageSignUp();
  }
}
