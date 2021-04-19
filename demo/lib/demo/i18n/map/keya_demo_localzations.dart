import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class KeyaDemoLocalzations {
  final Locale locale;

  KeyaDemoLocalzations(this.locale);

  static KeyaDemoLocalzations of(BuildContext context) {
    return Localizations.of<KeyaDemoLocalzations>(
      context,
      KeyaDemoLocalzations,
    );
  }

  static Map<String, String> _dd = {'as': 'a'};

  static Map<String, Map<String, String>> _localized = {
    "en": {'title': 'Hello'},
    'zh': {
      'title': '您好',
    }
  };

  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class KeyaDemoLocalizationsDelegate
    extends LocalizationsDelegate<KeyaDemoLocalzations> {
  KeyaDemoLocalizationsDelegate();

  @override
  Future<KeyaDemoLocalzations> load(Locale locale) {
    return SynchronousFuture<KeyaDemoLocalzations>(
        KeyaDemoLocalzations(locale));
  }

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<KeyaDemoLocalzations> old) {
    return false;
  }
}
