import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/domain/repository/chat_remote_repository_impl.dart';

import '../../data/model/chat_by_id_data_model.dart';
import '../../data/model/chat_by_id_model.dart';

class ChatRemoteUsecase {
  final remoteRepositoryImpl = ChatRemoteRepositoryImpl();
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllChatCollection(doc) {
    return remoteRepositoryImpl.getAllChatCollection(doc);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserChat(phoneNumber) {
    return remoteRepositoryImpl.getUserChat(phoneNumber);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getChatCollectionById(
      ChatByIdModel? data) {
    return remoteRepositoryImpl.getChatCollectionById(data);
  }

  Future<DocumentReference<Map<String, dynamic>>> setChatCollectionById(
      ChatByIdModel? model, ChatByIdDataModel? body) {
    return remoteRepositoryImpl.setChatCollectionById(model, body);
  }
}
