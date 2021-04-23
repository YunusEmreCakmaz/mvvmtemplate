import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvmtemplate/core/base/model/base_view_model.dart';
import 'package:mvvmtemplate/view/authentication/onboard/model/on_board_model.dart';
part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {
    onBoardList = List.generate(5, (index) => OnBoardModel(index.toString()));
  }

  List<OnBoardModel> onBoardList;

  @observable
  int currentPageIndex = 0;

  @action
  void onPageChanged(int index) {
    currentPageIndex = index;
  }
}
