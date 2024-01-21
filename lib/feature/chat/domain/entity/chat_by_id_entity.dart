class ChatByIdEntity {
  String? rechiver;
  String? sendBy;
  String? doc;

  ChatByIdEntity(this.rechiver, this.sendBy, this.doc);

  ChatByIdEntity.fromJson(dynamic json) {
    rechiver = json["rechiver"];
    sendBy = json["send_by"];
    doc = json["doc"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["rechiver"] = rechiver;
    data["send_by"] = sendBy;
    data["doc"] = doc;
    return data;
  }
}
