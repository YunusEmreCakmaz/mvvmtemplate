import 'package:mvvmtemplate/core/base/model/base_model.dart';

class PostModel extends BaseModel<PostModel> {
  int userId;
  int id;
  String title;
  String body;

  PostModel({this.userId, this.id, this.title, this.body});

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  @override
  Map<String, Object> toJson() {
    final data = <String, Object>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  @override
  PostModel fromJson(Map<String, Object> json) {
    return PostModel.fromJson(json);
  }
}
