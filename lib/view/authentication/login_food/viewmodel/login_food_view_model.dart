import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/init/network/network_manager.dart';
import '../model/login_food_model.dart';
import '../service/ilogin_service.dart';
import '../service/login_service.dart';

part 'login_food_view_model.g.dart';

class LoginFoodViewModel = _LoginFoodViewModelBase with _$LoginFoodViewModel;

abstract class _LoginFoodViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  TextEditingController emailController;
  TextEditingController passwordController;
  ILoginService loginService;
  void setContext(BuildContext context) => this.context = context;
  void init() {
    loginService = LoginService(NetworkManager.instance.coreDio);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = false;

  Future<void> fetchLoginService() async {
    isLoadingChange();
    if (formState.currentState.validate()) {
      final response = await loginService.fetchUserControl(LoginFoodModel(
          email: emailController.text, password: passwordController.text));

      if (response != null) {
        if (scaffoldState.currentState != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('response.token'),
          ));
        }
        await localeManager.setStringValue(
            PreferencesKeys.TOKEN, response.token);
      }
    }
    isLoadingChange();
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }
}
