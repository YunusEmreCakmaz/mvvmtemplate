import 'package:flutter/material.dart';
import 'package:mvvmtemplate/view/_product/_enums/network_routes.dart';
import '../../../../../core/constants/enums/http_type_enum.dart';
import '../../../../../core/init/network/icore_dio.dart';
import '../../../../_product/_utility/service_helper.dart';
import '../model/house_model.dart';
import '../service/ibuild_feed_service.dart';

class BuildFeedService extends IBuildFeedService with ServiceHelper {
  BuildFeedService(ICoreDio dio, GlobalKey<ScaffoldState> key)
      : super(dio, key);

  @override
  Future<List<HouseModel>> fetchUserHouseList() async {
    final response = await dio.fetch<List<HouseModel>, HouseModel>(
        NetworkRoutes.BUILD_HOME.rawValue,
        parseModel: HouseModel(),
        type: HttpTypes.GET);
    //showMessage(scaffoldKey, response.error);
    return response.data;
  }
}
