import 'package:flutter/material.dart';
import 'package:tyba_test/app/context/settings/app_settings.dart';
import 'package:tyba_test/core/entities/models/university.dart';

class UniversityDetailView extends StatelessWidget {
  static const route = "universityDetailView";
  static final AppSettings appSettings = AppSettings();

  const UniversityDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final University model =
        ModalRoute.of(context)!.settings.arguments as University;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appSettings.primaryColor,
        title: Text(
          model.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
