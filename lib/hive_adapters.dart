import 'package:hive_flutter/hive_flutter.dart';
import 'package:loc/features/gallery_feature/data/models/address_model.dart';
import 'package:loc/features/gallery_feature/data/models/company_model.dart';
import 'package:loc/features/gallery_feature/data/models/geo_model.dart';
import 'package:loc/features/gallery_feature/data/models/user_model.dart';

Future<void> registerAdapters() async {
  Hive.registerAdapter<UserModel>(UserModelAdapter());

  Hive.registerAdapter<AddressModel>(AddressModelAdapter());

  Hive.registerAdapter<GeoModel>(GeoModelAdapter());

  Hive.registerAdapter<CompanyModel>(CompanyModelAdapter());
}
