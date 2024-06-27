// ignore_for_file: lines_longer_than_80_chars, prefer_constructors_over_static_methods
import 'package:intl/intl.dart';
import 'package:timefull/exports.dart';

class AppLocalizations {
  static AppLocalizations? _current;

  static AppLocalizations get current {
    _current ??= AppLocalizations();
    return _current!;
  }

  static Future<AppLocalizations> load(Locale locale) {
    final name = locale.countryCode == null ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      _current = instance;
      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ?? AppLocalizations();
  }

  String get appName => Intl.message('Timeful');
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);
}
