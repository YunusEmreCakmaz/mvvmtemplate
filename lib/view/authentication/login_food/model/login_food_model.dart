import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';

part 'login_food_model.g.dart';

@JsonSerializable()
class LoginFoodModel extends BaseModel {
  final String email;
  final String password;

  LoginFoodModel({this.email, this.password});

  LoginFoodModel fromJson(Map<String, Object> json) {
    return _$LoginFoodModelFromJson(json);
  }

  Map<String, Object> toJson() {
    return _$LoginFoodModelToJson(this);
  }
}
