import 'package:flutter/material.dart';

import '../../../../core/extension/future_extension.dart';
import '../../../../core/init/network/icore_dio.dart';
import '../../../../core/init/network/network_manager.dart';
import '../model/social_user_model.dart';
import '../service/isocial_service.dart';
import '../service/social_service.dart';

class SocialUserViewDetail extends StatelessWidget {
  final SocialUser socialUser;

  final ICoreDio manager = NetworkManager.instance.coreDio;

  ISocialService get socialServiceService => SocialService(manager, null);

  SocialUserViewDetail({
    Key key,
    this.socialUser,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: socialServiceService.fetchUser(socialUser.id).toBuild<SocialUser>(
          onSuccess: (data) {
            return Center(child: Image.network(data.image));
          },
          loadingWidget: CircularProgressIndicator(),
          notFoundWidget: Center(
            child: Text('Not Found'),
          ),
          onError: Text('error')),
    );
  }
}
