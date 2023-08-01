import 'Origin.dart';
import 'Location.dart';

class Characters1 {

  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late Origin ?origin;
  late Location ?location;
  late String image;
  late List<String> episode;
  late String url;
  late String created;

  Characters1({
      required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      this.origin,
      this.location,
      required this.image,
      required this.episode,
      required this.url,
      required this.created,});

  Characters1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin = json['origin'] != null ? Origin.fromJson(json['origin']) : null;
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    image = json['image'];
    episode = json['episode'] != null ? json['episode'].cast<String>() : [];
    url = json['url'];
    created = json['created'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['status'] = status;
    map['species'] = species;
    map['type'] = type;
    map['gender'] = gender;
    if (origin != null) {
      map['origin'] = origin?.toJson();
    }
    if (location != null) {
      map['location'] = location?.toJson();
    }
    map['image'] = image;
    map['episode'] = episode;
    map['url'] = url;
    map['created'] = created;
    return map;
  }

}