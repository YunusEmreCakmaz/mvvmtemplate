import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mvvmtemplate/core/init/lang/locale_keys.g.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/image/image_constants.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../viewmodel/login_food_view_model.dart';

class LoginFoodView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginFoodViewModel>(
      viewModel: LoginFoodViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, value) => DefaultTabController(
        length: 2,
        child: Scaffold(
          key: value.scaffoldState,
          body: SafeArea(
            child: Column(
              children: [
                buildAnimatedContainer(context),
                buildContainerTabBar(context),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: context.paddingNormal,
                    child: buildForm(value, context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer(BuildContext context) {
    return AnimatedContainer(
      duration: context.durationLow,
      height:
          context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
      color: Colors.white,
      child: Center(
        child: Image.asset(ImageConstants.instance.hotDog),
      ),
    );
  }

  Container buildContainerTabBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: context.width * 0.1,
            right: context.width * 0.1,
            bottom: context.width * 0.01),
        child: buildTabBar(context),
      ),
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
      labelColor: Colors.black,
      labelStyle: context.textTheme.headline5,
      unselectedLabelStyle: context.textTheme.headline5,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.yellow,
      indicatorWeight: 5,
      tabs: [
        Tab(text: '   ${LocaleKeys.login_tab1.locale}   '),
        Tab(text: '   ${LocaleKeys.login_tab2.locale}   '),
      ],
    );
  }

  Form buildForm(LoginFoodViewModel value, BuildContext context) {
    return Form(
      key: value.formState,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          Spacer(flex: 6),
          buildTextFormFieldEmail(context, value),
          buildTextFormFieldPassword(context, value),
          Spacer(),
          buildTextForgot(),
          Spacer(flex: 6),
          buildElevatedButtonLogin(context, value),
          buildWrapForgot(),
          Spacer(),
        ],
      ),
    );
  }

  Widget buildTextFormFieldPassword(
          BuildContext context, LoginFoodViewModel viewModel) =>
      Observer(builder: (_) {
        return TextFormField(
          controller: viewModel.passwordController,
          obscureText: viewModel.isLockOpen,
          validator: (value) => value.isNotEmpty ? null : 'This field required',
          decoration: InputDecoration(
            labelText: LocaleKeys.login_password.locale,
            labelStyle: context.textTheme.subtitle1,
            icon: buildContainerIconField(context, Icons.vpn_key),
            suffixIcon: TextButton(
              onPressed: () {
                viewModel.isLockStateChange();
              },
              child: Observer(builder: (_) {
                return Icon(
                    viewModel.isLockOpen ? Icons.lock : Icons.lock_open);
              }),
            ),
          ),
        );
      });

  TextFormField buildTextFormFieldEmail(
      BuildContext context, LoginFoodViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      validator: (value) => value.isValidEmail,
      decoration: InputDecoration(
        labelText: LocaleKeys.login_email.locale,
        labelStyle: context.textTheme.subtitle1,
        icon: buildContainerIconField(context, Icons.email),
      ),
    );
  }

  Container buildContainerIconField(BuildContext context, IconData icon) {
    return Container(
      child: Icon(icon, color: context.colors.primaryVariant),
      color: context.colors.onError,
      padding: context.paddingLow,
    );
  }

  Widget buildTextForgot() => Align(
      alignment: Alignment.centerRight,
      child: Text(
        LocaleKeys.login_forgotText.locale,
        textAlign: TextAlign.end,
      ));

  Widget buildElevatedButtonLogin(
      BuildContext context, LoginFoodViewModel viewModel) {
    return Observer(builder: (_) {
      return ElevatedButton(
        onPressed: viewModel.isLoading
            ? null
            : () {
                viewModel.fetchLoginService();
              },
        child: Center(
            child: Text(
          LocaleKeys.login_login.locale,
          style: context.textTheme.headline5,
        )),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(context.paddingNormal),
          backgroundColor: MaterialStateProperty.all(context.theme.errorColor),
          shape: MaterialStateProperty.all(StadiumBorder()),
        ),
      );
    });
  }

  Wrap buildWrapForgot() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(LocaleKeys.login_dontAccount.locale),
        TextButton(onPressed: () {}, child: Text(LocaleKeys.login_tab2.locale))
      ],
    );
  }
}
