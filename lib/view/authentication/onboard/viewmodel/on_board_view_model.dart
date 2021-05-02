import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/_constants/image_path_svg.dart';
import '../model/on_board_model.dart';

part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page1_title,
        LocaleKeys.onBoard_page1_desc, SVGImagePath.instance.astronautSVG));
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page2_title,
        LocaleKeys.onBoard_page2_desc, SVGImagePath.instance.chattingSVG));
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page3_title,
        LocaleKeys.onBoard_page3_desc, SVGImagePath.instance.relaxSVG));
  }

  @observable
  int currentIndex = 0;

  @action
  void changeCurrentIndex(int index) {
    currentIndex = index;
  }

  @observable
  bool isLoading = false;

  List<OnBoardModel> onBoardItems = [];

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> completeToOnBoard() async {
    changeLoading();
    await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
    changeLoading();

    await navigation.navigateToPageClear(path: NavigationConstants.TEST_VIEW);
  }
}
