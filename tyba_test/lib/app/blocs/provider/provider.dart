import 'package:tyba_test/app/blocs/home_bloc.dart';

import '../splash_bloc.dart';
import 'bloc.dart';
import 'bloc_cache.dart';

class Provider {
  static T? of<T extends Bloc>(Function instance) {
    switch (T) {
      case SplashBloc:
        {
          return BlocCache.getBlocInstance("SplashBloc", instance) as T;
        }
      case HomeBloc:
        {
          return BlocCache.getBlocInstance("HomeBloc", instance) as T;
        }
    }
    return null;
  }

  static void dispose<T extends Bloc>() {
    switch (T) {
      case SplashBloc:
        {
          BlocCache.dispose("SplashBloc");
          break;
        }
      case HomeBloc:
        {
          BlocCache.dispose("HomeBloc");
          break;
        }
    }
  }
}
