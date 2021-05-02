import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/text/auto_locale_text.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../_product/_widgets/avatar/on_board_circle.dart';
import '../model/on_board_model.dart';
import '../viewmodel/on_board_view_model.dart';

class OnBoardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, viewModel) => Scaffold(
          body: Padding(
        padding: context.paddingNormalHorizontal,
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 5,
              child: buildPageView(viewModel),
            ),
            Expanded(
              flex: 2,
              child: buildRowFooter(viewModel, context),
            ),
          ],
        ),
      )),
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
      itemCount: viewModel.onBoardItems.length,
      itemBuilder: (context, index) =>
          buildColumnBody(context, viewModel.onBoardItems[index]),
      onPageChanged: (value) {
        viewModel.changeCurrentIndex(value);
      },
    );
  }

  Row buildRowFooter(OnBoardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildListViewCircles(viewModel),
        Expanded(child: Center(child: Observer(builder: (_) {
          return Visibility(
              visible: viewModel.isLoading, child: CircularProgressIndicator());
        }))),
        buildFloatingActionButtonSkip(context, viewModel)
      ],
    );
  }

  ListView buildListViewCircles(OnBoardViewModel viewModel) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) => Padding(
        padding: context.paddingLow,
        child: Observer(builder: (_) {
          return OnBoardCircle(isSelected: viewModel.currentIndex == index);
        }),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButtonSkip(
      BuildContext context, OnBoardViewModel viewModel) {
    return FloatingActionButton(
      backgroundColor: context.colors.secondaryVariant,
      child: Icon(
        Icons.keyboard_arrow_right,
        color: context.colors.primaryVariant,
      ),
      onPressed: () => viewModel.completeToOnBoard(),
    );
  }

  Column buildColumnBody(BuildContext context, OnBoardModel onBoardModel) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: buildSvgPicture(onBoardModel.imagePath),
        ),
        buildColumnDescription(context, onBoardModel),
      ],
    );
  }

  Column buildColumnDescription(
      BuildContext context, OnBoardModel onBoardModel) {
    return Column(
      children: [
        buildAutoLocalTextTitle(onBoardModel, context),
        Padding(
          padding: context.paddingMediumHorizontal,
          child: buildAutoLocalTextDesc(onBoardModel, context),
        ),
      ],
    );
  }

  AutoLocalText buildAutoLocalTextDesc(
      OnBoardModel onBoardModel, BuildContext context) {
    return AutoLocalText(
        value: onBoardModel.description,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontWeight: FontWeight.w100,
            ));
  }

  AutoLocalText buildAutoLocalTextTitle(
      OnBoardModel onBoardModel, BuildContext context) {
    return AutoLocalText(
      value: onBoardModel.title,
      style: Theme.of(context).textTheme.headline3.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colors.onSecondary,
          ),
    );
  }

  SvgPicture buildSvgPicture(String path) => SvgPicture.asset(path);
}
