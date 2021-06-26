import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvmtemplate/core/constants/enums/http_type_enum.dart';
import 'package:mvvmtemplate/core/init/cache/locale_manager.dart';
import 'package:mvvmtemplate/core/init/navigation/navigation_service.dart';
import 'package:mvvmtemplate/core/init/network/core_dio.dart';
import 'package:mvvmtemplate/core/init/network/icore_dio.dart';
import 'package:mvvmtemplate/view/authentication/onboard/model/on_board_model.dart';
import 'package:mvvmtemplate/view/authentication/onboard/viewmodel/on_board_view_model.dart';

import '../../core/network/dio_mock_model.dart';

class OnBoardMockViewModel implements OnBoardViewModel {
  @override
  BuildContext context;

  @override
  ICoreDio coreDio;

  IStringHelper stringHelper;

  @override
  bool isLoading = false;

  @override
  void init() {
    coreDio = CoreDio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
    stringHelper = MockStringHelper();
  }

  Future<void> onBoardGetModels() async {
    final response = await coreDio.fetch<List<PostModel>, PostModel>('/posts', type: HttpTypes.GET, parseModel: PostModel());

    if (response.data is List) {
      onBoardItems = response.data.map((e) => OnBoardModel(stringHelper.toUpper(e.title), '', '')).toList().cast<OnBoardModel>();
    }
  }

  Future<void> getServiceRequest() async {
    isLoading = true;
    await onBoardGetModels();
    isLoading = false;
  }

  @override
  void setContext(BuildContext context) {}

  @override
  List<OnBoardModel> onBoardItems;

  @override
  int currentIndex;

  @override
  void changeCurrentIndex(int index) {
    throw UnimplementedError();
  }

  @override
  LocaleManager localeManager;

  @override
  NavigationService navigation;

  @override
  void changeLoading() {
    throw UnimplementedError();
  }

  @override
  Future<void> completeToOnBoard() async {
    throw UnimplementedError();
  }
}

abstract class IStringHelper {
  String toUpper(String data);
}

class MockStringHelper extends IStringHelper {
  @override
  String toUpper(String data) {
    return data.toUpperCase();
  }
}
