import '../../../../core/init/network/icore_dio.dart';
import '../model/login_food_model.dart';
import '../model/login_food_response_model.dart';

abstract class ILoginService {
  final ICoreDio dio;

  ILoginService(this.dio);

  Future<LoginFoodResponseModel> fetchUserControl(LoginFoodModel model);
}
