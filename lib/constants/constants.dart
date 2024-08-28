import 'package:data_provider/data_provider.dart';

const kDefaultBaseUrl = 'http://192.168.1.108:3000';

extension ImagePathExtender on String {
  String fullPath() {
    return '$kDefaultBaseUrl/$this';
  }
}

extension LocaleChanger on LanguageModel {
  String changeLocale(String locale) {
    return locale == 'tk' ? tm! : ru!;
  }
}
