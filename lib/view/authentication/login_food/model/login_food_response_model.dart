import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';

part 'login_food_response_model.g.dart';

@JsonSerializable()
class LoginFoodResponseModel extends BaseModel {
  final String token;

  LoginFoodResponseModel({this.token});

  @override
  LoginFoodResponseModel fromJson(Map<String, Object> json) {
    return _$LoginFoodResponseModelFromJson(json);
  }

  @override
  Map<String, Object> toJson() {
    return _$LoginFoodResponseModelToJson(this);
  }
}
