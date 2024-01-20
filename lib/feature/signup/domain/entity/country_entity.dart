class CountryEntity {
  String? name;
  String? dialCode;
  String? id;

  CountryEntity(this.name, this.dialCode, this.id);

  CountryEntity.fromJson(dynamic json) {
    name = json["name"];
    dialCode = json["dial_code"];
    id = json["code"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = name;
    data["dial_code"] = dialCode;
    data['code'] = id;
    return data;
  }
}
