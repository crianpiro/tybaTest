
import 'package:tyba_test/core/repositories/user_repository.dart';
import 'package:tyba_test/core/source/user_source.dart';

class DataSourceInjector {
  static DataSourceInjector? _singleton;
  final String _apiBaseUrl = 'tyba-assets.s3.amazonaws.com';

  factory DataSourceInjector(){
    _singleton ??= DataSourceInjector._();
    return _singleton!;
  }

  DataSourceInjector._();

  UserApiSource provideUserApiSource(){
    return UserApiSourceImpl(_apiBaseUrl);
  }
}