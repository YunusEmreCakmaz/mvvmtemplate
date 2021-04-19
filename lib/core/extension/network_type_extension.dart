import '../constants/enums/http_type_enum.dart';

extension NetworkTypeExtension on HttpTypes {
  String get rawValue {
    switch (this) {
      case HttpTypes.GET:
        return "GET";
        break;
      case HttpTypes.POST:
        return "POST";
        break;
      default:
        throw "ERROR_TYPE";
    }
  }
}
