import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/domain/entity/chat_by_id_entity.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/domain/repository/chat_remote_repository_impl.dart';

import '../../data/model/chat_by_id_model.dart';

class ChatRemoteUsecase {
  final remoteRepositoryImpl = ChatRemoteRepositoryImpl();
  Future<QuerySnapshot<Map<String, dynamic>>> getChatCollection(
      ChatByIdEntity? chatByIdEntity) {
    final data = ChatByIdModel.fromJson(chatByIdEntity!.toJson());
    return remoteRepositoryImpl.getChatCollection(data);
  }
}
