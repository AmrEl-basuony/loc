import 'package:hive_flutter/adapters.dart';

part 'geo_model.g.dart';

@HiveType(typeId: 3)
class GeoModel {
  @HiveField(0)
  String? lat;
  @HiveField(1)
  String? lng;
  
  GeoModel({
    lat,
    lng,
  });

  GeoModel.fromJson(Map<String, dynamic> json) {
    lat = json["lat"];
    lng = json["lng"];
  }
}
