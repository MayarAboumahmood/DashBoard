import 'package:get/get.dart';
import 'ar.dart';
import 'en.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': ar,
        'en': en,
      };
}
