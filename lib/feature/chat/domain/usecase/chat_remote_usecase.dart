import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/domain/repository/chat_remote_repository_impl.dart';

class ChatRemoteUsecase {
  final remoteRepositoryImpl = ChatRemoteRepositoryImpl();
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllChatCollection(doc) {
    return remoteRepositoryImpl.getAllChatCollection(doc);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserChat(phoneNumber) {
    return remoteRepositoryImpl.getUserChat(phoneNumber);
  }
}
