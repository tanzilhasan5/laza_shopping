class TermsCondition {
  bool? success;
  String? message;
  List<TermsData>? data;

  TermsCondition({this.success, this.message, this.data});

  TermsCondition.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TermsData>[];
      json['data'].forEach((v) {
        data!.add(TermsData.fromJson(v));
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

class TermsData {
  int? id;
  String? heading;
  String? description;

  TermsData({this.id, this.heading, this.description});

  TermsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    description = json['discription']; // note: API spelling is "discription"
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['id'] = id;
    map['heading'] = heading;
    map['discription'] = description;
    return map;
  }
}