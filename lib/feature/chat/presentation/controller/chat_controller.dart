import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/domain/entity/chat_by_id_data_entity.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/domain/usecase/chat_remote_usecase.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/presentation/widget/card_chat.dart';
import 'package:get/get.dart';

import '../../../../core/service/otp_service.dart';

class ChatController extends GetxController {
  final chat = CardChat();
  final localSevicer = LocalService();
  final remoteUseCase = ChatRemoteUsecase();
  Rx<String> phoneNumber = ''.obs;

  getSessionData() async {
    phoneNumber.value = await localSevicer.sessionCalled() ?? '+62';
  }

  validationDataEntry(BuildContext context, doc, {Widget? dataEntriEmpty}) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: getChatCollection(doc),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final data = snapshot.data!.docs.last.data();
          final lastChat = ChatByIdDataEntity.fromJson(data);
          return chat.chat(context, lastChat);
        }
      },
    );
  }

  //ONLY USECASE
  Stream<QuerySnapshot<Map<String, dynamic>>> getChatCollection(doc) {
    return remoteUseCase.getAllChatCollection(doc);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserChat(phoneNumber) {
    return remoteUseCase.getUserChat(phoneNumber);
  }

  @override
  void onInit() {
    getSessionData();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
