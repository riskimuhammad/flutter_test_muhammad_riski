import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_muhammad_riski/feature/chat/data/model/chat_by_id_model.dart';

class ChatRemoteDatasources {
  Stream<QuerySnapshot<Map<String, dynamic>>> getUserChat(phoneNumber) {
    final data = FirebaseFirestore.instance
        .collection('chat')
        .where('id', isEqualTo: phoneNumber)
        .snapshots();
    return data;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllChatCollection(doc) {
    final data = FirebaseFirestore.instance
        .collection('chat')
        .doc(doc)
        .collection('message')
        .snapshots();
    return data;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getChatCollectionById(
      ChatByIdModel? model) {
    final data = FirebaseFirestore.instance
        .collection('chat')
        .doc(model!.doc)
        .collection('message')
        .where('rechiver', isEqualTo: model.rechiver)
        .where('send_by', isEqualTo: model.sendBy)
        .snapshots();
    return data;
  }
}
