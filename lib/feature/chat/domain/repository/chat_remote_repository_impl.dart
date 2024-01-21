import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/data/model/chat_by_id_data_model.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/data/model/chat_by_id_model.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/data/repository/chat_remote_repository.dart';

class ChatRemoteRepositoryImpl implements ChatRemoteRepository {
  ChatRemoteRepository _remoteRepository = ChatRemoteRepository();
  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getChatCollectionById(
      ChatByIdModel? data) {
    return _remoteRepository.getChatCollectionById(data);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getUserChat(phoneNumber) {
    return _remoteRepository.getUserChat(phoneNumber);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllChatCollection(doc) {
    return _remoteRepository.getAllChatCollection(doc);
  }

  @override
  Future<DocumentReference<Map<String, dynamic>>> setChatCollectionById(
      ChatByIdModel? model, ChatByIdDataModel? body) {
    return _remoteRepository.setChatCollectionById(model, body);
  }
}
