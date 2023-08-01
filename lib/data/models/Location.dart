class Location {
  late String name;
  late String url;

  Location({
      required this.name,
      required this.url,});

  Location.fromJson(dynamic json) {
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