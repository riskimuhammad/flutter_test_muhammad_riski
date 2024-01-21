import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/presentation/controller/chat_controller.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/presentation/widget/end_to_end_chat_body.dart';
import 'package:get/get.dart';

class MainPageEndToEndChat extends StatelessWidget {
  MainPageEndToEndChat({super.key});
  final body = EndToEndChatBody();
  final controller = Get.find<ChatController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(),
      initState: (state) {},
      builder: (controller) => Scaffold(
        body: body.body(
          context: context,
        ),
      ),
    );
  }
}
