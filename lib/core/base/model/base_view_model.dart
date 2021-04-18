import 'package:flutter/cupertino.dart';

abstract class BaseViewModel {
  BuildContext context;
  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
