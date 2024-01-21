import 'package:cloud_firestore/cloud_firestore.dart';

class ChatByIdDataModel {
  String? rechiver;
  Timestamp? time;
  String? message;
  String? sendBy;
  String? disPlayName;
  String? id;

  ChatByIdDataModel(this.rechiver, this.time, this.message, this.sendBy,
      this.disPlayName, this.id);

  ChatByIdDataModel.fromJson(dynamic json) {
    id = json["id"];
    rechiver = json["rechiver"];
    time = json["time"];
    message = json["message"];
    sendBy = json["send_by"];
    disPlayName = json["send_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["rechiver"] = rechiver;
    data["time"] = time;
    data["message"] = message;
    data["send_by"] = sendBy;
    data["send_name"] = disPlayName;
    return data;
  }
}
