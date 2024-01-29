import 'package:hive_flutter/adapters.dart';
import 'package:loc/features/gallery_feature/data/models/address_model.dart';
import 'package:loc/features/gallery_feature/data/models/company_model.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? username;
  @HiveField(3)
  String? email;
  @HiveField(4)
  AddressModel? address;
  @HiveField(5)
  String? phone;
  @HiveField(6)
  String? website;
  @HiveField(7)
  CompanyModel? company;
  
  UserModel({
    id,
    name,
    username,
    email,
    address,
    phone,
    website,
    company,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json["name"];
    username = json["username"];
    email = json["email"];
    address = AddressModel.fromJson(json["address"]);
    phone = json["phone"];
    website = json["website"];
    company = CompanyModel.fromJson(json["company"]);
  }
}
