class ChatByIdModel {
  String? rechiver;
  String? sendBy;

  ChatByIdModel(this.rechiver, this.sendBy);

  ChatByIdModel.fromJson(dynamic json) {
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
