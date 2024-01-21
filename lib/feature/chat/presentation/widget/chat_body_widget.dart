import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/core/helper/route_helper.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_color.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/presentation/controller/chat_controller.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/helper/resolution_size.dart';
import '../../../../core/material/material_text_style.dart';

class ChatBodyWidget {
  final controller = Get.find<ChatController>();

  body(context) {
    return Obx(() => StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.getUserChat("+62${controller.phoneNumber.value}"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data!.docs.isNotEmpty) {
                return Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) =>
                        controller.validationListChatWidget(
                            context, snapshot.data!.docs[index].id),
                  ),
                );
              } else {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        PhosphorIcons.chatCircleText(
                            PhosphorIconsStyle.regular),
                        color: BionicColors.white,
                        size: 60,
                      ),
                      normalResolutionSizeHeight,
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: Text(
                          'Mulai chat dengan siapapun yang ada di kontak anda',
                          style: materialTextStyle.normalTextStyleGrey,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                );
              }
            } else {
              return SizedBox();
            }
          },
        ));
  }
}
