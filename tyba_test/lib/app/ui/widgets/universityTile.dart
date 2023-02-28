import 'package:flutter/material.dart';
import 'package:tyba_test/app/context/settings/app_settings.dart';
import 'package:tyba_test/core/entities/models/university.dart';

class UniversityTile extends StatelessWidget {
  final University model;
  static final AppSettings appSettings = AppSettings();

  const UniversityTile(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        model.name,
        style: TextStyle(
            color: appSettings.primaryColor, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "Country: ${model.country}",
        style: TextStyle(color: appSettings.primaryColor, fontSize: 12),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_forward_ios,
            color: appSettings.secondaryColor,
          )),
      onTap: (){},
    );
  }
}
