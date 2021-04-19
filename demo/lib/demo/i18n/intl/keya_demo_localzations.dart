import 'package:intl/intl.dart';

class KeyaDemoLocalzations {
  String get title => Intl.message(
        'title',
        name: 'title',
        desc: 'demo localzations.',
      );

  String greet(String name) => Intl.message(
        'hello $name',
        name: 'greet',
        desc: 'greet someone',
        args: [name],
      );
}
