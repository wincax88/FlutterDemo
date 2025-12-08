import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection.dart';
import 'features/user/presentation/bloc/user_bloc.dart';
import 'features/user/presentation/pages/user_list_page.dart';
import 'features/user/domain/usecases/get_user_by_id.dart';
import 'features/user/domain/usecases/get_all_users.dart';
import 'features/user/domain/repositories/user_repository.dart';
import 'features/user/data/repositories/user_repository_impl.dart';
import 'features/user/data/datasources/user_remote_datasource.dart';
import 'features/user/data/datasources/user_local_datasource.dart';

void main() {
  // 初始化依赖注入（使用 injectable 时取消注释）
  // 首先运行: flutter pub run build_runner build --delete-conflicting-outputs
  // configureDependencies();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 方式1: 手动创建依赖（当前方式，用于演示）
    final remoteDataSource = UserRemoteDataSourceImpl();
    final localDataSource = UserLocalDataSourceImpl();
    final userRepository = UserRepositoryImpl(
      remoteDataSource: remoteDataSource,
      localDataSource: localDataSource,
    );
    final getUserById = GetUserById(userRepository);
    final getAllUsers = GetAllUsers(userRepository);

    // 方式2: 使用依赖注入（配置 injectable 后使用）
    // final getUserById = getIt<GetUserById>();
    // final getAllUsers = getIt<GetAllUsers>();
    // final userRepository = getIt<UserRepository>();

    return MaterialApp(
      title: 'Flutter Clean Architecture Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => UserBloc(
          getUserById: getUserById,
          getAllUsers: getAllUsers,
          userRepository: userRepository,
        ),
        child: const UserListPage(),
      ),
    );
  }
}

