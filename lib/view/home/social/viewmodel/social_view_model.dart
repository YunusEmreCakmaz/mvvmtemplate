import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/init/network/network_manager.dart';
import '../../../_product/_models/query/friend_query.dart';
import '../../../_product/_utility/thorottle_helper.dart';
import '../model/social_user_model.dart';
import '../service/isocial_service.dart';
import '../service/social_service.dart';

part 'social_view_model.g.dart';

class SocialViewModel = _SocialViewModelBase with _$SocialViewModel;

abstract class _SocialViewModelBase with Store, BaseViewModel {
  ISocialService _socialService;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  int _page = 0;
  String _query = '';
  bool isLazyLoadDataFinish = false;
  ThrottleStringHelper _throttleStringHelper;

  @observable
  List<SocialUser> socialUserList = [];

  @observable
  bool isLoading = false;

  @observable
  bool isLazyLoading = false;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    _socialService = SocialService(NetworkManager.instance.coreDio, scaffoldKey);
    _throttleStringHelper = ThrottleStringHelper();
    _fetchAllUser();
  }

  @action
  Future<void> _fetchAllUser() async {
    _changeLoading();
    final response = await _socialService.fetchSocialUserList(FriendQuery());
    socialUserList = response;
    _changeLoading();
  }

  @action
  Future<void> fetchAllUserLoading(int index) async {
    if (isLazyLoading || index != socialUserList.length - 1 || isLazyLoadDataFinish) return;
    _changeLoading();

    final response = await _socialService.fetchSocialUserList(FriendQuery(limit: _page + 1, q: _query));

    if (response.isNotEmpty) {
      if (socialUserList.isEmpty) {
        socialUserList = response;
      } else if (response.last != socialUserList.last) {
        socialUserList.addAll(response);
        socialUserList = socialUserList;
      }
      _page++;
    } else {
      isLazyLoadDataFinish = true;
    }

    _changeLoading();
  }

  @action
  void fetchAllSearchQuery(String text) {
    _throttleStringHelper.onDelayTouch(text, (text) {
      if (_query.isEmpty) {
        _page = -1;
      }
      _query = text;
      isLazyLoadDataFinish = false;
      socialUserList = [];
      fetchAllUserLoading(socialUserList.length - 1);
    });
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void _changeLazyLoading() {
    isLazyLoading = !isLazyLoading;
  }
}
