import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/core/controller/controller.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/presentation/page/main_page_chat.dart';
import 'package:flutter_test_muhammad_riski/feature/signup/presentation/page/main_page_signup.dart';
import 'package:get/get.dart';

class ValidationPage extends StatelessWidget {
  const ValidationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainController>();
    return Obx(
      () => controller.sessionReady.value ? MainPageChat() : MainPageSignUp(),
    );
  }
}
