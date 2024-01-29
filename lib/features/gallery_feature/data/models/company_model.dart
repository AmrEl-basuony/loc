import 'package:hive_flutter/adapters.dart';

part 'company_model.g.dart';

@HiveType(typeId: 4)
class CompanyModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? catchPhrase;
  @HiveField(2)
  String? bs;
  
  CompanyModel({
    name,
    catchPhrase,
    bs,
  });

  CompanyModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    catchPhrase = json["catchPhrase"];
    bs = json["bs"];
  }
}
