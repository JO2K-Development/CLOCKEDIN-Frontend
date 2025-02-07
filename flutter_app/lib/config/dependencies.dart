import 'package:flutter_app/data/repositories/abstract/auth_repository.dart';
import 'package:flutter_app/data/repositories/abstract/current_user_repository.dart';
import 'package:flutter_app/data/repositories/abstract/management_repository.dart';
import 'package:flutter_app/data/repositories/abstract/users_repository.dart';
import 'package:flutter_app/data/repositories/production/auth_repository.dart';
import 'package:flutter_app/data/repositories/production/current_user_repository.dart';
import 'package:flutter_app/data/repositories/production/management_repository.dart';
import 'package:flutter_app/data/repositories/production/users_repository.dart';
import 'package:flutter_app/data/repositories/testing/auth_repository.dart';
import 'package:flutter_app/data/repositories/testing/current_user_repository.dart';
import 'package:flutter_app/data/repositories/testing/management_repository.dart';
import 'package:flutter_app/data/repositories/testing/users_repository.dart';
import 'package:flutter_app/data/services/local/local_storage_service.dart';
import 'package:flutter_app/data/services/remote/api_client.dart';
import 'package:flutter_app/data/services/remote/auth_client.dart';
import 'package:flutter_app/routing/routes_language_support.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get shared {
  return [
    Provider(create: (context) => LanguageSupportUtil())
  ];
}


List<SingleChildWidget> get testingProviders {
  return [
    // Provider(
    //   create: (context) => AuthApiClient(),
    // ),
    // Provider(
    //   create: (context) => ApiClient(),
    // ),
    ...shared,
    Provider(
      create: (context) => LocalDataService(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthRepositoryTesting(
        localDataService: context.read(),
      ) as AuthRepository,
    ),
    Provider(
      create: (context) => UsersRepositoryTesting(
        localDataService: context.read(),
      ) as UsersRepository,
    ),
    Provider(
      create: (context) => CurrentUserRepositoryTesting(
        localDataService: context.read(),
      ) as CurrentUserRepository,
    ),
    Provider(
      create: (context) => ManagementRepositoryTesting(
        localDataService: context.read(),
      ) as ManagementRepository,
    ),
  ];
}

List<SingleChildWidget> get productionProviders {
  return [
    ...shared,
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
      create: (context) => AuthRepositoryProduction(
        authApiClient: context.read(),
        apiClient: context.read(),
        localDataService: context.read(),
      ) as AuthRepository,
    ),
    Provider(
      create: (context) => UsersRepositoryProduction(
        localDataService: context.read(),
        apiClient: context.read(),
      ) as UsersRepository,
    ),
    Provider(
      create: (context) => CurrentUserRepositoryProduction(
        localDataService: context.read(),
        apiClient: context.read(),
      ) as CurrentUserRepository,
    ),
    Provider(
      create: (context) => ManagementRepositoryProduction(
        localDataService: context.read(),
        apiClient: context.read(),
      ) as ManagementRepository,
    ),
  ];
} 