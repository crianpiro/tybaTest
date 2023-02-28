
import 'package:tyba_test/core/domain/user_useCase.dart';
import 'package:tyba_test/core/injectors/repository_injector.dart';

class Injector{
  static Injector? _singleton;
  factory Injector(){
    _singleton ??= Injector._();
    return _singleton!;
  }
  Injector._();

  UserUseCase provideUserUseCase(){
    return UserUseCaseImpl(
      RepositoryInjector().provideUserRepository()
    );
  }
}