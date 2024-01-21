import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/domain/entity/chat_by_id_data_entity.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/domain/usecase/chat_remote_usecase.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/presentation/widget/card_chat.dart';
import 'package:get/get.dart';

import '../../../../core/service/otp_service.dart';
import '../../data/model/chat_by_id_data_model.dart';
import '../../data/model/chat_by_id_model.dart';

class ChatController extends GetxController {
  final chat = CardChat();
  final localSevicer = LocalService();
  final remoteUseCase = ChatRemoteUsecase();
  Rx<String> phoneNumber = ''.obs;
  var pesanController = TextEditingController().obs;
  RxList<QueryDocumentSnapshot<Object?>> listSnapshot =
      <QueryDocumentSnapshot<Object?>>[].obs;

  getSessionData() async {
    phoneNumber.value = await localSevicer.sessionCalled() ?? '+62';
  }

  validationListChatWidget(BuildContext context, doc,
      {Widget? dataEntriEmpty}) {
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
          return chat.chat(context, doc, lastChat);
        }
      },
    );
  }

  sendMessage(ChatByIdModel? model, phoneNumberTo, displayName) async {
    final body = ChatByIdDataModel(
        phoneNumberTo,
        Timestamp.now(),
        pesanController.value.text,
        "+62${phoneNumber.value}",
        displayName,
        model!.id);
    pesanController.value.clear();
    await setChatCollectionById(model, body);
  }

  validationChatByIdWidget(BuildContext context,
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snap, index) {
    final data = ChatByIdDataEntity.fromJson(snap.data!.docs[index].data());

    return Obx(() => chat.roomChatCard(data, "+62${phoneNumber.value}"));
  }

  //ONLY USECASE
  Stream<QuerySnapshot<Map<String, dynamic>>> getChatCollection(doc) {
    return remoteUseCase.getAllChatCollection(doc);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserChat(phoneNumber) {
    return remoteUseCase.getUserChat(phoneNumber);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getChatCollectionById(
      ChatByIdModel? data) {
    return remoteUseCase.getChatCollectionById(data);
  }

  Future<DocumentReference<Map<String, dynamic>>> setChatCollectionById(
      ChatByIdModel? model, ChatByIdDataModel? body) {
    return remoteUseCase.setChatCollectionById(model, body);
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
    listSnapshot.refresh();
    super.onReady();
  }
}
