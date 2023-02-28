

import 'package:tyba_test/app/context/settings/preferences/preferences.dart';
import 'package:tyba_test/core/domain/user_useCase.dart';
import 'provider/bloc.dart';

class SplashBloc extends Bloc {

  final UserUseCase _userUseCase;

  final Preferences _preferences = Preferences();

  SplashBloc(this._userUseCase);

  @override
  void dispose() {}
  
  Future<void> loadUniversities() async {
    if(_preferences.universities.isEmpty){
      await _userUseCase.getUniversities();
    }
  }


}