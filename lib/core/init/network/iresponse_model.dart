abstract class IResponseModel<T> {
  T data;
  IErrorModel error;
}

abstract class IErrorModel<T> {
  int statusCode;
  String description;
}

class ResponseModel<T> extends IResponseModel<T> {
  @override
  final T data;
  @override
  final IErrorModel error;

  ResponseModel({this.data, this.error});
}
