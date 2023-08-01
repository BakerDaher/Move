import 'package:move/data/models/Quato/Slip.dart';

class Advice {
  Slip? slip;

  Advice({this.slip});

  Advice.fromJson(Map<String, dynamic> json) {
    slip = json['slip'] != null ? new Slip.fromJson(json['slip']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slip != null) {
      data['slip'] = this.slip!.toJson();
    }
    return data;
  }
}