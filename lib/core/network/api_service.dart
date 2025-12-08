import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/user/data/models/user_model.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // 用户相关接口示例
  @GET('/users/{id}')
  Future<UserModel> getUserById(@Path('id') String id);

  @GET('/users')
  Future<List<UserModel>> getAllUsers();

  @POST('/users')
  Future<UserModel> createUser(@Body() UserModel user);

  @DELETE('/users/{id}')
  Future<void> deleteUser(@Path('id') String id);
}

