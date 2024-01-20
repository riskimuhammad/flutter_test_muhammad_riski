import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/feature/contact/presentation/controller/contact_controller.dart';
import 'package:flutter_test_muhammad_riski/feature/contact/presentation/widget/contact_appbar_widget.dart';
import 'package:get/get.dart';

import '../widget/contact_body_widget.dart';

class MianPageContact extends StatelessWidget {
  MianPageContact({super.key});
  final appBar = ContactAppBarWidget();
  final body = ContactBodyWidget();
  final controller = Get.find<ContactController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactController>(
      init: ContactController(),
      initState: (state) {
        controller.getContact();
      },
      builder: (controller) => Scaffold(
        appBar: appBar.appBar(),
        body: body.body(context),
      ),
    );
  }
}
