import 'package:cloud_firestore/cloud_firestore.dart';

class RemoteService {
  Future<CollectionReference<Map<String, dynamic>>>
      initialChatCollection() async {
    final chatCollection = await FirebaseFirestore.instance.collection('chat');
    return chatCollection;
  }
}
