import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/init/lang/language_manager.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/test_view_model.dart';
import '../../../../core/extension/string_extension.dart';

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
        appBar: AppBar(
          title: Text(LocaleKeys.welcome.locale),
          actions: [textWelcomeWidget()],
        ),
        floatingActionButton: floatingActionButtonNumberIncrement,
        body: textNumber,
      );

  IconButton textWelcomeWidget() {
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

  Widget get textNumber =>
      Observer(builder: (context) => Text(viewModel.number.toString()));
}
