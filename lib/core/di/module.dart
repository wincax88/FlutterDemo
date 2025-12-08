import 'package:injectable/injectable.dart';
import '../../features/user/data/datasources/user_local_datasource.dart';
import '../../features/user/data/datasources/user_remote_datasource.dart';
import '../../features/user/data/repositories/user_repository_impl.dart';
import '../../features/user/domain/repositories/user_repository.dart';
import '../../features/user/domain/usecases/get_user_by_id.dart';
import '../../features/user/domain/usecases/get_all_users.dart';
import '../network/api_client.dart';

// 数据源注册
@module
abstract class DataSourceModule {
  @lazySingleton
  UserRemoteDataSource get userRemoteDataSource => UserRemoteDataSourceImpl();

  @lazySingleton
  UserLocalDataSource get userLocalDataSource => UserLocalDataSourceImpl();
}

// 仓库注册
@module
abstract class RepositoryModule {
  @lazySingleton
  UserRepository userRepository(
    UserRemoteDataSource remoteDataSource,
    UserLocalDataSource localDataSource,
  ) =>
      UserRepositoryImpl(
        remoteDataSource: remoteDataSource,
        localDataSource: localDataSource,
      );
}

// UseCase 注册
@module
abstract class UseCaseModule {
  @lazySingleton
  GetUserById getUserById(UserRepository repository) => GetUserById(repository);

  @lazySingleton
  GetAllUsers getAllUsers(UserRepository repository) => GetAllUsers(repository);
}

// 网络模块注册
@module
abstract class NetworkModule {
  @lazySingleton
  ApiClient get apiClient => ApiClient();
}

