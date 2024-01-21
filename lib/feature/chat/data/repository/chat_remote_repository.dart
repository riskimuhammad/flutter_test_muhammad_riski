import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/data/datasources/remote_datasources.dart';

import '../model/chat_by_id_model.dart';

class ChatRemoteRepository implements ChatRemoteDatasources {
  final _remoterDatasources = ChatRemoteDatasources();
  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getChatCollection(
      ChatByIdModel? data) {
    return _remoterDatasources.getChatCollection(data);
  }
}
