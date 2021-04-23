import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../../core/init/lang/language_manager.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/test_view_model.dart';

class TestView extends StatefulWidget {
  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        viewModel = model;
      },
      onPageBuilder: (context, value) => Text("data"),
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: appBar(),
        floatingActionButton: floatingActionButtonNumberIncrement,
        body: textNumber,
      );

  AppBar appBar() {
    return AppBar(
      leading:
          Text(LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)),
      title: textWelcomeWidget(),
      actions: [iconButtonChangeTheme()],
    );
  }

  Text textWelcomeWidget() => Text(LocaleKeys.welcome.locale);

  IconButton iconButtonChangeTheme() {
    return IconButton(
        icon: Icon(Icons.change_history),
        onPressed: () {
          context.setLocale(LanguageManager.instance.enLocale);
        });
  }

  FloatingActionButton get floatingActionButtonNumberIncrement {
    return FloatingActionButton(
      onPressed: () {
        viewModel.incrementNumber();
      },
    );
  }

  Widget get textNumber {
    return Column(children: [
      mailField,
      Observer(builder: (context) => Text(viewModel.number.toString())),
    ]);
  }
}

extension _FormField on _TestViewState {
  TextFormField get mailField => TextFormField(
        validator: (value) => value.isValidEmail,
      );
}
