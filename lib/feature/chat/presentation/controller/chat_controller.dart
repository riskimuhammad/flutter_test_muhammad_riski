import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/domain/entity/chat_by_id_entity.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/domain/usecase/chat_remote_usecase.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final remoteUseCase = ChatRemoteUsecase();

  getChatById(phoneNumber, sendBy) async {
    final body = ChatByIdEntity(phoneNumber, sendBy);
    final data = await getChatCollection(body);
    log('data ${data.docs[0].data()}');
  }

  //ONLY USECASE
  Future<QuerySnapshot<Map<String, dynamic>>> getChatCollection(
      ChatByIdEntity? chatByIdEntity) {
    return remoteUseCase.getChatCollection(chatByIdEntity);
  }
}
