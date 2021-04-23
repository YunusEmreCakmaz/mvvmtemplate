import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mvvmtemplate/core/base/view/base_view.dart';
import 'package:mvvmtemplate/core/components/column/form_column.dart';
import 'package:mvvmtemplate/view/_widgets/listview/on_board_indicator.dart';
import 'package:mvvmtemplate/view/authentication/onboard/viewmodel/on_board_view_model.dart';
import 'package:mvvmtemplate/core/extension/context_extension.dart';

class OnBoardView extends StatefulWidget {
  @override
  _OnBoardViewState createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  OnBoardViewModel onBoardViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        onBoardViewModel = model;
      },
      onPageBuilder: (context, value) => Scaffold(
        body: buildColumnBody(),
      ),
    );
  }

  Column buildColumnBody() {
    return Column(
      children: [
        Expanded(
          child: buildPageView(),
        ),
        Expanded(
          child: buildObserverIndicator(),
        )
      ],
    );
  }

  PageView buildPageView() {
    return PageView.builder(
      itemCount: onBoardViewModel.onBoardList.length,
      itemBuilder: (context, index) => Container(
        color: context.randomColor,
        child: FormColumn(
          children: [
            Placeholder(),
            Text(onBoardViewModel.onBoardList[index].text),
          ],
        ),
      ),
      onPageChanged: (index) {
        onBoardViewModel.onPageChanged(index);
      },
    );
  }

  Observer buildObserverIndicator() {
    return Observer(builder: (_) {
      return OnBoardIndcator(
        itemCount: onBoardViewModel.onBoardList.length,
        currentIndex: onBoardViewModel.currentPageIndex,
      );
    });
  }
}
