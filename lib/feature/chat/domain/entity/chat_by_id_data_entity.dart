import 'package:cloud_firestore/cloud_firestore.dart';

class ChatByIdDataEntity {
  String? receiver;
  Timestamp? time;
  String? message;
  String? sendBy;
  String? disPlayName;

  ChatByIdDataEntity(this.receiver, this.time, this.message, this.sendBy);

  ChatByIdDataEntity.fromJson(dynamic json) {
    receiver = json["receiver"];
    time = json["time"];
    message = json["message"];
    sendBy = json["send_by"];
    disPlayName = json["send_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["receiver"] = receiver;
    data["time"] = time;
    data["message"] = message;
    data["send_by"] = sendBy;
    data["send_name"] = disPlayName;
    return data;
  }
}
