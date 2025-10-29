class PrivacyPolicyModel {
  bool? success;
  String? message;
  List<PrivacyData>? data;

  PrivacyPolicyModel({this.success, this.message, this.data});

  PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PrivacyData>[];
      json['data'].forEach((v) {
        data!.add(PrivacyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class PrivacyData {
  int? id;
  String? heading;
  String? description;

  PrivacyData({this.id, this.heading, this.description});

  PrivacyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    description = json['discription']; // note: API key is "discription"
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['id'] = id;
    map['heading'] = heading;
    map['discription'] = description;
    return map;
  }
}