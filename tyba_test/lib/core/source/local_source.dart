import 'dart:collection';
import 'dart:convert';
import 'package:tyba_test/app/context/settings/preferences/preferences.dart';
import 'package:tyba_test/core/entities/models/university.dart';
import 'package:tyba_test/core/entities/dto/result_model.dart';
import 'package:tyba_test/core/entities/dto/event.dart';


class LocalSourceImpl {

  final Preferences _preferences = Preferences();

  Result<Event<List<University>>> getUniversities() {

    mapperFunction(value) {
      value = json.decode(value);

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

    return Result<Event<List<University>>>.success(mapperFunction(_preferences.universities));
  }
}
