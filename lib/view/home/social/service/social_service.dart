import 'package:flutter/material.dart';

import '../../../../core/constants/enums/http_type_enum.dart';
import '../../../../core/init/network/icore_dio.dart';
import '../../../_product/_enums/network_routes.dart';
import '../../../_product/_models/query/friend_query.dart';
import '../../../_product/_models/query/friend_query_enum.dart';
import '../../../_product/_utility/service_helper.dart';
import '../model/social_user_model.dart';
import 'isocial_service.dart';

class SocialService extends ISocialService with ServiceHelper {
  SocialService(ICoreDio dio, GlobalKey<ScaffoldState> key) : super(dio, key);

  @override
  Future<List<SocialUser>> fetchSocialUserList(FriendQuery query) async {
    final response = await dio.fetch<List<SocialUser>, SocialUser>(
      NetworkRoutes.FRIENDS.rawValue,
      parseModel: SocialUser(),
      type: HttpTypes.GET,
      queryParameters: {
        FriendQueryEnum.LIMIT.rawValue: query.limit,
        FriendQueryEnum.Q.rawValue: query.q,
      },
    );
    showMessage(scaffoldKey, response.error);
    return response.data;
  }

  @override
  Future<SocialUser> fetchUser(id) async {
    final response = await dio.fetch<SocialUser, SocialUser>(
      NetworkRoutes.FRIENDS.rawValue,
      parseModel: SocialUser(),
      urlSuffix: '/$id',
      type: HttpTypes.GET,
    );
    showMessage(scaffoldKey, response.error);
    return response.data;
  }

  @override
  Future<List<SocialUser>> fetchUserNameQuery(String text) {
    throw UnimplementedError();
  }
}
