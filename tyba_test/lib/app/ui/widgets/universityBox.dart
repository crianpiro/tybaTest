import 'package:flutter/material.dart';
import 'package:tyba_test/app/context/settings/app_settings.dart';
import 'package:tyba_test/core/entities/models/university.dart';

class UniversityBox extends StatelessWidget {
  final University model;
  static final AppSettings appSettings = AppSettings();

  const UniversityBox(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(5.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: appSettings.primaryColor.withOpacity(0.7)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              model.name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  color: appSettings.primaryColor, fontWeight: FontWeight.bold),
            ),
            Text(
              "Country: ${model.country}",
              style: TextStyle(color: appSettings.primaryColor, fontSize: 12),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: appSettings.secondaryColor,
                )),
          ],
        ),
      ),
      onTap: (){},
    );
  }
}
