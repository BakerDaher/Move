class Slip {
  int? id;
  String? advice;

  Slip({this.id, this.advice});

  Slip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    advice = json['advice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['advice'] = this.advice;
    return data;
  }
}