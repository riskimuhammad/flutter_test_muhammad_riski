import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  Rx<TextEditingController> nameController =
      TextEditingController(text: '').obs;
  Rx<TextEditingController> emailController =
      TextEditingController(text: '').obs;
  Rx<TextEditingController> passwordController =
      TextEditingController(text: '').obs;
  Rx<bool> rememberCheck = false.obs;

  onChageRemember(value) {
    rememberCheck.value = value;
  }
}
