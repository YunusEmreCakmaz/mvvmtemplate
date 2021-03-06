import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboard_mock_view_model.dart';

void main() {
  OnBoardMockViewModel mockViewModel;
  IStringHelper stringHelper;
  setUp(() {
    SharedPreferences.setMockInitialValues({'token': 'asdasd'}); //set values here

    mockViewModel = OnBoardMockViewModel();
    stringHelper = MockStringHelper();

    mockViewModel.init();
  });
  test('String Helper Upper Case', () {
    var text = ' Helelo';
    text = stringHelper.toUpper(text);
    expect(text.contains(RegExp('[A-Z\s]+')), true);
  });

  test('OnBoard Get Models', () async {
    await mockViewModel.onBoardGetModels();
    expect(mockViewModel.onBoardItems, isNotEmpty);
  });

  test('OnBoard Get Service Request', () async {
    expect(mockViewModel.isLoading, false);
    await mockViewModel.getServiceRequest();
    expect(mockViewModel.isLoading, true);
  });

  test('OnBoard On Page Changed', () {
    mockViewModel.changeCurrentIndex(5);
    expect(5, mockViewModel.currentIndex);
  });

  group('Test All', () {
    var index = 0;
    test('OnBoard Get Models', () async {
      await mockViewModel.onBoardGetModels();
      index = mockViewModel.onBoardItems.length;
      expect(mockViewModel.onBoardItems, isNotEmpty);
    });

    test('OnBoard On Page Changed', () {
      mockViewModel.changeCurrentIndex(index);
      expect(index, mockViewModel.currentIndex);
    });
  });
}
