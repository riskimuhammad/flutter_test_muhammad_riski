import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/feature/register/presentation/controller/login_controller.dart';
import 'package:flutter_test_muhammad_riski/feature/register/presentation/page/main_login.dart';
import 'package:get/get.dart';

void main() {
  runApp(BionicTestApp());
}

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}

class BionicTestApp extends StatelessWidget {
  const BionicTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      home: InitialApp(),
    );
  }
}

class InitialApp extends StatelessWidget {
  const InitialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MainRegister();
  }
}
