import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';

@JsonSerializable()
class TestModel extends BaseModel {
  int userId;
  int id;
  String title;
  bool completed;

  TestModel({this.userId, this.id, this.title, this.completed});

  @override
  Map<String, Object> toJson() {
    final data = <String, Object>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }

  @override
  fromJson(Map<String, Object> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }
}
