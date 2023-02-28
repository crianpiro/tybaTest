import 'package:flutter/material.dart';
import 'package:tyba_test/app/blocs/provider/provider.dart';
import 'package:tyba_test/app/context/settings/app_settings.dart';

import '../blocs/provider/bloc.dart';

abstract class BaseState<T extends StatefulWidget,K extends Bloc> extends State<T>{
  late K bloc;

  final  AppSettings appSettings = AppSettings();

  @override
  void initState() {
    bloc = Provider.of<K>(getBlocInstance)!;
    super.initState();
    onStartup();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    Provider.dispose<K>();
    super.dispose();
  }

  K getBlocInstance();

  void onStartup();
}