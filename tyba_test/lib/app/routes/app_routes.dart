import 'package:flutter/material.dart';
import 'package:tyba_test/app/ui/views/homeView.dart';
import 'package:tyba_test/app/ui/views/universityDetailView.dart';

class ApplicationRoutes {

  Map<String, WidgetBuilder> getApplicationRoutes(){
    return {
      HomeView.route: (BuildContext context) => HomeView(),
      UniversityDetailView.route: (BuildContext context) => UniversityDetailView(),
    };
  }
}
