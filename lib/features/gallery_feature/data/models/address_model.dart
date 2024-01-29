import 'package:hive_flutter/adapters.dart';
import 'package:loc/features/gallery_feature/data/models/geo_model.dart';

part 'address_model.g.dart';

@HiveType(typeId: 2)
class AddressModel  {
  @HiveField(0)
  String? street;
  @HiveField(1)
  String? suite;
  @HiveField(2)
  String? city;
  @HiveField(3)
  String? zipcode;
  @HiveField(4)
  GeoModel? geo;
  AddressModel({
    street,
    suite,
    city,
    zipcode,
    geo,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    street = json["street"];
    suite = json["suite"];
    city = json["city"];
    zipcode = json["zipcode"];
    geo = json["geo"] == null ? null : GeoModel.fromJson(json["geo"]);
  }
}
