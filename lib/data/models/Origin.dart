class Origin {

  late String name;
  late String url;

  Origin({
      required this.name,
      required this.url,});

  Origin.fromJson(dynamic json) {
    name = json['name'];
    url = json['url'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['url'] = url;
    return map;
  }

}