import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/data/model/chat_by_id_model.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/data/repository/chat_remote_repository.dart';

class ChatRemoteRepositoryImpl implements ChatRemoteRepository {
  ChatRemoteRepository _remoteRepository = ChatRemoteRepository();
  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getChatCollection(
      ChatByIdModel? data) {
    return _remoteRepository.getChatCollection(data);
  }
}
