import 'package:flutter/material.dart';
import 'package:mvvmtemplate/core/base/view/base_view.dart';
import 'package:mvvmtemplate/core/extension/context_extension.dart';
import 'package:mvvmtemplate/view/authentication/login/viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (context, value) => buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
          body: ListView(
        children: [
          Container(
            padding: context.paddingLow,
            height: context.height * .4,
            color: context.colors.background,
            child: buildText(context),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.lowValue),
            child: Placeholder(),
          ),
        ],
      ));

  Text buildText(BuildContext context) {
    return Text("Hello",
        style: context.textTheme.subtitle1
            .copyWith(color: context.theme.primaryColor));
  }
}
