import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/data/datasources/remote_datasources.dart';

import '../model/chat_by_id_model.dart';

class ChatRemoteRepository implements ChatRemoteDatasources {
  final _remoterDatasources = ChatRemoteDatasources();
  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getChatCollectionById(
      ChatByIdModel? data) {
    return _remoterDatasources.getChatCollectionById(data);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getUserChat(phoneNumber) {
    return _remoterDatasources.getUserChat(phoneNumber);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllChatCollection(doc) {
    return _remoterDatasources.getAllChatCollection(doc);
  }
}
