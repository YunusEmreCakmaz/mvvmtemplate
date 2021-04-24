import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';

@JsonSerializable()
class TestModel extends BaseModel {
  int userId;
  int id;
  String title;
  bool completed;

  TestModel({this.userId, this.id, this.title, this.completed});

  Map<String, Object> toJson() {
    final Map<String, Object> data = new Map<String, Object>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
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
