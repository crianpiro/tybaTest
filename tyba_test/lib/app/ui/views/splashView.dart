import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tyba_test/app/ui/base_state.dart';
import 'package:tyba_test/app/ui/views/homeView.dart';
import 'package:tyba_test/core/injectors/injector.dart';

import '../../blocs/splash_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends BaseState<SplashView,SplashBloc> {

  @override
  void onStartup() {    
    initApp();
  }
  @override
  SplashBloc getBlocInstance() {
    return SplashBloc(Injector().provideUserUseCase());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            CircularProgressIndicator(color: appSettings.primaryColor,backgroundColor:  appSettings.secondaryColor,),
            Text("Loading...",style: TextStyle(color: appSettings.primaryColor),)
          ],
        ),
      )
    );
  }

  Future<void> initApp() async {
    return bloc.loadUniversities().whenComplete(() => Navigator.pushReplacementNamed(context, HomeView.route));    
  }
}
