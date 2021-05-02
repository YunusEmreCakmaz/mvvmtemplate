// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_food_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginFoodViewModel on _LoginFoodViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_LoginFoodViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isLockOpenAtom = Atom(name: '_LoginFoodViewModelBase.isLockOpen');

  @override
  bool get isLockOpen {
    _$isLockOpenAtom.reportRead();
    return super.isLockOpen;
  }

  @override
  set isLockOpen(bool value) {
    _$isLockOpenAtom.reportWrite(value, super.isLockOpen, () {
      super.isLockOpen = value;
    });
  }

  final _$_LoginFoodViewModelBaseActionController =
      ActionController(name: '_LoginFoodViewModelBase');

  @override
  void isLoadingChange() {
    final _$actionInfo = _$_LoginFoodViewModelBaseActionController.startAction(
        name: '_LoginFoodViewModelBase.isLoadingChange');
    try {
      return super.isLoadingChange();
    } finally {
      _$_LoginFoodViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLockStateChange() {
    final _$actionInfo = _$_LoginFoodViewModelBaseActionController.startAction(
        name: '_LoginFoodViewModelBase.isLockStateChange');
    try {
      return super.isLockStateChange();
    } finally {
      _$_LoginFoodViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLockOpen: ${isLockOpen}
    ''';
  }
}
