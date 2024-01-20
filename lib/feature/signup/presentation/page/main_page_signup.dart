import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/feature/signup/presentation/controller/signup_controller.dart';
import 'package:flutter_test_muhammad_riski/feature/signup/presentation/widget/signup_body_widget.dart';
import 'package:get/get.dart';

class MainPageSignUp extends StatelessWidget {
  MainPageSignUp({super.key});
  final body = SignupBodyWidget();
  final controller = Get.find<SignupController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
        init: SignupController(),
        initState: (state) {
          controller.build();
        },
        builder: (controller) => Scaffold(
              body: body.body(context),
            ));
  }
}
