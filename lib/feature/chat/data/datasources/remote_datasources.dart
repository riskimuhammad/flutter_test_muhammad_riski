import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/data/model/chat_by_id_model.dart';

import '../../../../core/service/remote/remote_service.dart';

class ChatRemoteDatasources {
  final _remoteSevice = RemoteService();

  Future<QuerySnapshot<Map<String, dynamic>>> getChatCollection(
      ChatByIdModel? data) async {
    final collection = await _remoteSevice.initialChatCollection();
    final data = await collection
        .where('rechiver', isEqualTo: "+6285156006526")
        .where('send_by', isEqualTo: '+62851665577')
        .get();
    return data;
  }
}
