import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tyba_test/app/context/settings/preferences/preferences.dart';
import 'package:tyba_test/core/entities/models/university.dart';
import 'package:tyba_test/core/entities/dto/result_model.dart';
import 'package:tyba_test/core/entities/dto/event.dart';
import 'package:tyba_test/core/repositories/user_repository.dart';

import 'api_base_source.dart';

class UserApiSourceImpl extends ApiBaseSource implements UserApiSource {
  static const String _apiRouteUrl = 'FE-Engineer-test/';

  final Preferences _preferences =  Preferences();

  UserApiSourceImpl(String baseUrl, {http.Client? client})
      : super(baseUrl, client ?? http.Client());

  @override
  Future<Result<Event<List<University>>>> getUniversities() {
    String url = "${_apiRouteUrl}universities.json";

    mapperFunction(value) {

      if(_preferences.universities.isEmpty)_preferences.universities = json.encode(value);

      value = (value as List<dynamic>);

      var event = Event<List<University>>.fromJson(value);

      final List<University> itemsResponse = [];

      if (event.payload != null && event.payload!.body != null) {
        for (var item in event.payload!.body!) {
          University selectItemModel = University.fromJson(item);
          itemsResponse.add(selectItemModel);
        }
      }
      event.payload!.response = itemsResponse;
      return event;
    }

    return get<Event<List<University>>>(url, mapperFunction);
  }
}
