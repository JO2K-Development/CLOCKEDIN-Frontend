import 'package:flutter_app/data/repositories/auth_repository.dart';
import 'package:flutter_app/data/repositories/current_user_repository.dart';
import 'package:flutter_app/data/repositories/management_repository.dart';
import 'package:flutter_app/data/repositories/users_repository.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/data/services/remote/api_client.dart';
import 'package:flutter_app/data/services/remote/auth_client.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers {
  return [
    Provider(
      create: (context) => AuthApiClient(),
    ),
    Provider(
      create: (context) => ApiClient(),
    ),
    Provider(
      create: (context) => LocalDataService(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthRepository(
        authApiClient: context.read(),
        apiClient: context.read(),
        localDataService: context.read(),
      ),
    ),
    Provider(
      create: (context) => UsersRepository(
        localDataService: context.read(),
        apiClient: context.read(),
      ),
    ),
    Provider(
      create: (context) => CurrentUserRepository(
        localDataService: context.read(),
        apiClient: context.read(),
      ),
    ),
    Provider(
      create: (context) => ManagementRepository(
        localDataService: context.read(),
        apiClient: context.read(),
      ),
    ),
  ];
} 