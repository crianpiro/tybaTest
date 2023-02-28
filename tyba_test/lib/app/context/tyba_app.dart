import 'package:flutter/material.dart';
import 'package:tyba_test/app/routes/app_routes.dart';
import 'package:tyba_test/app/ui/views/splashView.dart';

class TybaApp extends StatelessWidget {

  const TybaApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
      routes: ApplicationRoutes().getApplicationRoutes(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Open Sans',
      ),
    );
  }

  
}