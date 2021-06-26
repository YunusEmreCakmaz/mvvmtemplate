import 'package:flutter/material.dart';

import '../../../../core/init/network/icore_dio.dart';
import '../../../_product/_models/query/friend_query.dart';
import '../model/social_user_model.dart';

abstract class ISocialService {
  final ICoreDio dio;
  final GlobalKey<ScaffoldState> scaffoldKey;

  ISocialService(this.dio, this.scaffoldKey);

  Future<List<SocialUser>> fetchSocialUserList(FriendQuery query);
  Future<List<SocialUser>> fetchUserNameQuery(String text);
  Future<SocialUser> fetchUser(id);
}
