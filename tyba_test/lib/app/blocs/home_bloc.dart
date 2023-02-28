import 'package:rxdart/rxdart.dart';
import 'package:tyba_test/core/domain/user_useCase.dart';
import 'package:tyba_test/core/entities/dto/event.dart';
import 'package:tyba_test/core/entities/dto/result_model.dart';
import 'package:tyba_test/core/entities/models/university.dart';
import 'provider/bloc.dart';

enum ViewType { gridView, listView }

class HomeBloc extends Bloc {
  final UserUseCase _userUseCase;

  final _viewTypeSubject = BehaviorSubject<ViewType>();

  int page = 0;

  ValueStream<ViewType> get viewType => _viewTypeSubject.stream;

  HomeBloc(this._userUseCase);

  @override
  void dispose() {
    _viewTypeSubject.close();
  }

  void changeView(ViewType newViewType) {
    _viewTypeSubject.sink.add(newViewType);
  }

  Future<List<University>> getUniversities() async {
    final result = await _userUseCase.getUniversities();
    if (result.errors == null) {
      final resultData = _getPayloadResponse(result);
      if (resultData != null) {
        return resultData;
      }
    }
    return [];
  }

  List<University>? _getPayloadResponse(Result<Event<dynamic>> result) {
    if (result.data != null && result.data!.payload != null) {
      return result.data!.payload!.response;
    }
    return null;
  }
}
