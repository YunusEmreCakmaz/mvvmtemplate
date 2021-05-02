import 'package:flutter/material.dart';
import '../../../../../core/init/network/icore_dio.dart';

import '../model/house_model.dart';

abstract class IBuildFeedService {
  final ICoreDio dio;
  final GlobalKey<ScaffoldState> scaffoldKey;

  IBuildFeedService(this.dio, this.scaffoldKey);

  Future<List<HouseModel>> fetchUserHouseList();
}
