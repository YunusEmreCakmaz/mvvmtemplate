import 'package:flutter_test/flutter_test.dart';
import 'package:mvvmtemplate/core/extension/string_extension.dart';

void main() {
  setUp(() {});
  test('Email Regexp', () {
    var email = 'joedoe@gmail.com';
    expect(email.isValidEmail, null);
  });
}
