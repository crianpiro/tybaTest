


import 'package:tyba_test/app/context/settings/preferences/preferences.dart';
import 'package:tyba_test/core/domain/user_useCase.dart';
import 'package:tyba_test/core/entities/dto/event.dart';
import 'package:tyba_test/core/entities/dto/result_model.dart';
import 'package:tyba_test/core/entities/models/university.dart';
import 'package:tyba_test/core/source/local_source.dart';

abstract class UserApiSource{
  Future<Result<Event<List<University>>>> getUniversities();
}

class UserRepositoryImpl implements UserRepository {

  final UserApiSource _userApiSource;
  final LocalSourceImpl _localSourceImpl = LocalSourceImpl();

  final Preferences _preferences = Preferences();

  UserRepositoryImpl(this._userApiSource);
  
  @override
  Future<Result<Event<List<University>>>> getUniversities(){
    if(_preferences.universities.isNotEmpty){
      return Future.value(_localSourceImpl.getUniversities());
    }
    return _userApiSource.getUniversities();
  }
}