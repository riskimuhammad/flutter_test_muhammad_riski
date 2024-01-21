class ChatByIdModel {
  String? id;
  String? rechiver;
  String? sendBy;
  String? doc;

  ChatByIdModel(this.rechiver, this.sendBy, this.doc, this.id);

  ChatByIdModel.fromJson(dynamic json) {
    id = json["id"];
    rechiver = json["rechiver"];
    sendBy = json["send_by"];
    doc = json["doc"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["rechiver"] = rechiver;
    data["send_by"] = sendBy;
    data["doc"] = doc;
    return data;
  }
}
