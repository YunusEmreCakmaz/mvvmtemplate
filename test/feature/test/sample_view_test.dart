import 'package:flutter_test/flutter_test.dart';
import 'package:mvvmtemplate/core/init/network/icore_dio.dart';
import 'package:mvvmtemplate/core/init/network/network_manager.dart';

main() {
  ICoreDio coreDio;
  setUp(() {
    coreDio = NetworkManager.instance.coreDio;
  });
  test("Sample", () {});
}
