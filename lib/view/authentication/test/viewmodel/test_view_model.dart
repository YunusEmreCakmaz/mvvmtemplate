import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvmtemplate/core/base/model/base_view_model.dart';
import 'package:mvvmtemplate/core/constants/enums/app_theme_enum.dart';
import 'package:mvvmtemplate/core/init/network/network_manager.dart';
import 'package:mvvmtemplate/core/init/notifier/theme_notifier.dart';
import 'package:mvvmtemplate/view/authentication/test/model/test_model.dart';
import 'package:provider/provider.dart';
part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}

  @observable
  bool isLoading = false;
  @observable
  int number = 0;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber() {
    number++;
  }

  void changeTheme() {
    Provider.of<ThemeNotifier>(context, listen: false)
        .changeValue(AppThemes.DARK);
  }

  @action
  Future<void> getSampleRequest() async {
    isLoading = true;
    await NetworkManager.instance.dioGet<TestModel>("x", TestModel());
    isLoading = false;
  }
}
