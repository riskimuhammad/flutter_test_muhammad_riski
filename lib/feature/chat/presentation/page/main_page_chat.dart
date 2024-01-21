import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/core/helper/route_helper.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_color.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/presentation/controller/chat_controller.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/presentation/widget/chat_appbar_widget.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/presentation/widget/chat_body_widget.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MainPageChat extends StatelessWidget {
  MainPageChat({super.key});
  final body = ChatBodyWidget();
  final appBar = ChatAppbarWidget();
  final controller = Get.find<ChatController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(),
      initState: (_) {
        controller.getChatById('', '');
      },
      builder: (_) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => Get.toNamed(routeHelper.toContact),
            backgroundColor: BionicColors.primaryColor,
            child:
                Icon(PhosphorIcons.chatCircleDots(PhosphorIconsStyle.regular)),
          ),
          appBar: appBar.appBar(),
          body: body.body(context),
        );
      },
    );
  }
}
