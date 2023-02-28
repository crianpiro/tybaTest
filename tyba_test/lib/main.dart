import 'dart:async';
import 'package:flutter/material.dart';
import 'app/context/settings/preferences/preferences.dart';
import 'app/context/tyba_app.dart';

void main() {
  runZoned<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = Preferences();
    await prefs.initPrefs();
    runApp(const TybaApp());
  },);
}


