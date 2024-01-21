class ChatByIdEntity {
  String? rechiver;
  String? sendBy;

  ChatByIdEntity(this.rechiver, this.sendBy);

  ChatByIdEntity.fromJson(dynamic json) {
    rechiver = json["rechiver"];
    sendBy = json["send_by"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["rechiver"] = rechiver;
    data["send_by"] = sendBy;
    return data;
  }
}
