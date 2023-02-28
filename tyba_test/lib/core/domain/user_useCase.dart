
import 'package:tyba_test/core/entities/dto/event.dart';
import 'package:tyba_test/core/entities/dto/result_model.dart';
import 'package:tyba_test/core/entities/models/university.dart';

abstract class UserRepository {
  Future<Result<Event<List<University>>>> getUniversities();
}

abstract class UserUseCase{ 
  Future<Result<Event<List<University>>>> getUniversities();
}

class UserUseCaseImpl implements UserUseCase {

  final UserRepository _repository;

  UserUseCaseImpl(this._repository);
  
  @override
  Future<Result<Event<List<University>>>> getUniversities(){ 
    return _repository.getUniversities();
  }
}