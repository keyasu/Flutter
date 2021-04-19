import 'package:demo_20210316/demo/i18n/map/keya_demo_localzations.dart';
import 'package:flutter/material.dart';

class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale local = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${local.languageCode}'),
            Text(local.toString()),
            Text(
              KeyaDemoLocalzations.of(context).title,
              // Localizations.of(context, KeyaDemoLocalzations).title,
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }
}
