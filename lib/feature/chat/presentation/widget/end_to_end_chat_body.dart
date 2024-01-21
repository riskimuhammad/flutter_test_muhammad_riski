import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_color.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_decoration.dart';
import 'package:flutter_test_muhammad_riski/core/material/material_text_style.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/data/model/chat_by_id_model.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/presentation/controller/chat_controller.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/presentation/widget/end_to_en_chat_appbar.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/helper/resolution_size.dart';

class EndToEndChatBody {
  final appBar = EndToEnChatAppbar();
  final controller = Get.find<ChatController>();
  body({context}) {
    final argument = Get.arguments;
    final id = argument['id'];
    final doc = argument['doc'];
    final rechiver = argument['rechiver'];
    final sendBy = argument['send_by'];
    final displayName = argument['send_name'];
    final body = ChatByIdModel(rechiver, sendBy, doc, id);
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: controller.getChatCollectionById(body),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data!.docs.isNotEmpty) {
              log('dsadas${snapshot}');
              return Obx(() => _listDataEntry(
                  context, snapshot, displayName, rechiver, body));
            } else {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      PhosphorIcons.chatCircleText(PhosphorIconsStyle.regular),
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
        });
  }

  _listDataEntry(
      context,
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snap,
      displayName,
      phoneNumberTo,
      body) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(children: [
                appBar.appBar(context, displayName),
                Expanded(
                    child: ListView.builder(
                        itemCount: snap.data!.docs.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return controller.validationChatByIdWidget(
                              context, snap, index);
                        }))
              ])),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: BionicColors.primaryColorDark,
                    boxShadow: [
                      BoxShadow(
                          color: BionicColors.greyDark,
                          offset: Offset(3, 3),
                          blurRadius: 5)
                    ]),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        PhosphorIcons.dotsThreeCircleVertical(),
                        size: 30,
                      ),
                      color: BionicColors.greyDark,
                    ),
                    largeResolutionSizeWidth,
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: TextFormField(
                          style: materialTextStyle.normalTextStyle,
                          textInputAction: TextInputAction.done,
                          controller: controller.pesanController.value,
                          decoration: materialDecoration.inputDecoration(
                              hintText: 'Pesan'),
                        ),
                      ),
                    ),
                    largeResolutionSizeWidth,
                    IconButton(
                      onPressed: () => controller.sendMessage(
                          body, phoneNumberTo, displayName),
                      icon: Icon(
                        PhosphorIcons.telegramLogo(),
                        size: 30,
                      ),
                      color: BionicColors.orangeDark,
                    ),
                  ],
                ),
              )),
        ]));
  }
}
