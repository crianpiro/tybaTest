
import 'package:tyba_test/core/domain/user_useCase.dart';
import 'package:tyba_test/core/injectors/dataSource_injector.dart';

import '../repositories/user_repository.dart';

class RepositoryInjector{
  static RepositoryInjector? _singleton;

  factory RepositoryInjector(){
    _singleton ??= RepositoryInjector._();
    return _singleton!;
  }

  RepositoryInjector._();

  UserRepository provideUserRepository(){
    return UserRepositoryImpl(
      DataSourceInjector().provideUserApiSource(),
    );
  }
}