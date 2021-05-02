import 'package:mvvmtemplate/core/constants/enums/http_type_enum.dart';
import 'package:mvvmtemplate/core/init/network/icore_dio.dart';
import 'package:mvvmtemplate/view/_product/_enums/network_routes.dart';
import 'package:mvvmtemplate/view/authentication/login_food/model/login_food_model.dart';
import 'package:mvvmtemplate/view/authentication/login_food/model/login_food_response_model.dart';
import 'ilogin_service.dart';

class LoginService extends ILoginService {
  LoginService(ICoreDio dio) : super(dio);

  @override
  Future<LoginFoodResponseModel> fetchUserControl(LoginFoodModel model) async {
    final response =
        await dio.fetch<LoginFoodResponseModel, LoginFoodResponseModel>(
            NetworkRoutes.LOGIN.rawValue,
            parseModel: LoginFoodResponseModel(),
            type: HttpTypes.POST,
            data: model);

    if (response.data is LoginFoodResponseModel) {
      return response.data;
    } else {
      return null;
    }
  }
}
