import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'sk'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? skText = '',
  }) =>
      [enText, skText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Home
  {
    '01o89ltf': {
      'en': 'Last scanned items',
      'sk': 'Naposledy naskenované položky',
    },
    '7v177thx': {
      'en': 'Open wizzard Debug',
      'sk': 'Otvorte skener',
    },
    '7a876va4': {
      'en': 'Home',
      'sk': 'Domov',
    },
  },
  // Settings
  {
    's8m3njvu': {
      'en': 'Profile settin',
      'sk': 'Nastavenia profilu',
    },
    'z4exo5ew': {
      'en': 'Change your information',
      'sk': 'Zmeňte svoje informácie',
    },
    'cfdmbpol': {
      'en': 'Logout',
      'sk': 'Odhlásiť sa',
    },
    'mg17prl1': {
      'en': 'Save settings',
      'sk': 'Uložiť nastavenia',
    },
    'hkfm3k80': {
      'en': 'Profile',
      'sk': 'Profil',
    },
  },
  // Camera
  {
    'd649aowc': {
      'en': 'Camera',
      'sk': 'fotoaparát',
    },
  },
  // Welcome
  {
    '80qblzhs': {
      'en': 'Shop smarter, live healthier',
      'sk': 'Nakupujte inteligentnejšie, žite zdravšie',
    },
    'xomazou2': {
      'en':
          'Discover all information about your food. Register for better personalization and tailored information',
      'sk':
          'Zistite všetky informácie o vašom jedle. Zaregistrujte sa pre lepšiu personalizáciu a prispôsobené informácie',
    },
    'jxo4sfdl': {
      'en': 'Register for free',
      'sk': 'Zaregistrujte sa zadarmo',
    },
    'vrs43w0j': {
      'en': 'Continue without registration',
      'sk': 'Pokračovať bez registrácie',
    },
    'n1s12n0g': {
      'en': 'Registration',
      'sk': 'Registrácia',
    },
    '5lau571u': {
      'en': 'Registrate using following platforms',
      'sk': 'Zaregistrujte sa pomocou nasledujúcich platforiem',
    },
    '25x4uzl2': {
      'en': 'Home',
      'sk': 'Domov',
    },
  },
  // SubSettings
  {
    'ld7ofmbx': {
      'en': 'Casper Ghost',
      'sk': 'Casper Ghost',
    },
    'bg589h68': {
      'en': 'casper@ghustbusters.com',
      'sk': 'casper@ghustbusters.com',
    },
    '62n0b6f1': {
      'en': 'My Account Information',
      'sk': 'Informácie o mojom účte',
    },
    '1ihorlxo': {
      'en': 'Support',
      'sk': 'podpora',
    },
    'aoikoq8o': {
      'en': 'Tutorial',
      'sk': 'Návod',
    },
    'sivfvm7g': {
      'en': 'Submit a Bug',
      'sk': 'Odoslať chybu',
    },
    'bs48x2wg': {
      'en': 'Submit a Feature Request',
      'sk': 'Odoslať žiadosť o funkciu',
    },
    '1hednwwd': {
      'en': 'Light ',
      'sk': 'Svetlo',
    },
    'cczz4vwc': {
      'en': 'Dark',
      'sk': 'Tmavý',
    },
    'm6y5vmfu': {
      'en': 'Log Out',
      'sk': 'Odhlásiť sa',
    },
    'hc06njtk': {
      'en': 'My Profile',
      'sk': 'Môj profil',
    },
    'wttyk6e8': {
      'en': '__',
      'sk': '__',
    },
  },
  // Wizard
  {
    '3wtz1sbg': {
      'en': 'Create your profile',
      'sk': 'Vytvorte si profil',
    },
    'hflbvdxk': {
      'en':
          'The completed data will only be used to personalize the results for you and will not be passed on to third parties.',
      'sk':
          'Vyplnené údaje budú použité iba na prispôsobenie výsledkov pre vás a nebudú poskytnuté tretím stranám.',
    },
    'nhigx45s': {
      'en': 'Fill out your information',
      'sk': 'Vyplňte svoje údaje',
    },
    'ju5x2gug': {
      'en': 'Continue to next step',
      'sk': 'Pokračujte ďalším krokom',
    },
    'b7er5pp3': {
      'en': 'Continue without registration',
      'sk': 'Pokračovať bez registrácie',
    },
    'u8l8bemr': {
      'en':
          'The completed data will only be used to personalize the results for you and will not be passed on to third parties.',
      'sk':
          'Vyplnené údaje budú použité iba na prispôsobenie výsledkov pre vás a nebudú poskytnuté tretím stranám.',
    },
    'iyvefphs': {
      'en': 'Finish registration',
      'sk': 'Dokončite registráciu',
    },
    'gwn7oggo': {
      'en': 'Home',
      'sk': 'Domov',
    },
  },
  // testPage
  {
    'blxb5l3u': {
      'en': 'Home',
      'sk': 'Domov',
    },
  },
  // OcrScannerPage
  {
    'd1h0oezq': {
      'en': 'Home',
      'sk': 'Domov',
    },
  },
  // OcrDateWizzard
  {
    'pefrrlfp': {
      'en': 'Home',
      'sk': '',
    },
  },
  // Notifications
  {
    'ituuabx5': {
      'en': 'Notifications',
      'sk': 'Upozornenia',
    },
    'axgz8q6h': {
      'en': 'Open',
      'sk': 'OTVORENÉ',
    },
    '8836p6te': {
      'en': '50%',
      'sk': '50 %',
    },
  },
  // SlidingUpPanelFromEan
  {
    'jk4xh0b8': {
      'en': 'Allergens',
      'sk': 'Alergény',
    },
    '5221zncg': {
      'en': 'Fat',
      'sk': 'Tuk',
    },
    'xe760vzf': {
      'en': 'Sugar',
      'sk': 'Cukor',
    },
    '65cuwcsd': {
      'en': 'Saturated fats',
      'sk': 'Nasýtené tuky',
    },
    'qs5r83dc': {
      'en': 'Salt',
      'sk': 'Soľ',
    },
    'wx6stky2': {
      'en': 'Ecoscore',
      'sk': 'Ekoskóre',
    },
    't4wyn9zh': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'sk':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud cvičenie ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Okrem sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
    'z861kbv3': {
      'en': 'Medication contraindications',
      'sk': 'Kontraindikácie liekov',
    },
    'ysgynb85': {
      'en': 'Nutrition data',
      'sk': 'Údaje o výžive',
    },
    'mettjq8p': {
      'en': '100 g/100ml',
      'sk': '100 g/100 ml',
    },
    '6n80je7x': {
      'en': 'Pull down for more information',
      'sk': 'Potiahnite pre viac informácií',
    },
  },
  // Header
  {
    'uy4uktgo': {
      'en': 'Scan your first product.',
      'sk': 'Naskenujte svoj prvý produkt.',
    },
  },
  // Intolerancies
  {
    'xtv5yvz4': {
      'en': 'My preferences',
      'sk': 'Moje preferencie',
    },
    '0wq8f3m4': {
      'en': 'Intolerancies',
      'sk': 'Intolerancie',
    },
    'wk3wjgs4': {
      'en': 'Wheat',
      'sk': 'Pšenica',
    },
    'p2mshd0m': {
      'en': 'Crustaceans',
      'sk': 'Kôrovce',
    },
    '3jo6ppbt': {
      'en': 'Eggs',
      'sk': 'Vajcia',
    },
    'l9fty51k': {
      'en': 'Fish',
      'sk': 'Ryby',
    },
    't9nu3dx8': {
      'en': 'Peanuts',
      'sk': 'Arašidy',
    },
    '56yvj6gf': {
      'en': 'Soybeans',
      'sk': 'Sója',
    },
    '70ryefpb': {
      'en': 'Milk',
      'sk': 'Mlieko',
    },
    'snee8f0w': {
      'en': 'Nuts',
      'sk': 'Orechy',
    },
    '9ux8lpst': {
      'en': 'Celery',
      'sk': 'Zeler',
    },
    'km3fczi3': {
      'en': 'Mustard',
      'sk': 'Horčica',
    },
    'hoeugyln': {
      'en': 'Sesame',
      'sk': 'Sezam',
    },
    's9x4vj8y': {
      'en': 'Sulphites',
      'sk': 'Oxid siričitý a siričitany',
    },
    '5oztm4nk': {
      'en': 'Lupin',
      'sk': 'Vlčí bôb',
    },
    'cjorje3a': {
      'en': 'Molluscs',
      'sk': 'Mäkkýše',
    },
  },
  // ScannedItem
  {
    'h1rwoyzn': {
      'en': '50%',
      'sk': '50 %',
    },
  },
  // OpenScannerButton
  {
    '83m0yhl8': {
      'en': 'Open scanner',
      'sk': 'Otvorte skener',
    },
  },
  // AddManuallyButton
  {
    '7dl2baci': {
      'en': 'Add manually',
      'sk': 'Pridať ručne',
    },
  },
  // ScanProductMessage
  {
    'cz2154o8': {
      'en': 'Scan product',
      'sk': 'Naskenujte produkt',
    },
  },
  // AuthComponent
  {
    'nltnyzvs': {
      'en': 'Sign in with Apple',
      'sk': 'Prihláste sa pomocou Apple',
    },
    'gbe6jirv': {
      'en': 'Continue with Facebook',
      'sk': 'Pokračujte s Facebookom',
    },
    '7s7pf04t': {
      'en': 'Sign in with Google',
      'sk': 'Prihláste sa pomocou Google',
    },
    'elbpjfvc': {
      'en': 'Continue without registration',
      'sk': 'Pokračovať bez registrácie',
    },
  },
  // Medication
  {
    'up263ymt': {
      'en': 'Medication',
      'sk': 'Lieky',
    },
    'c9rll9cf': {
      'en': 'Which medication you do use?',
      'sk': 'Aké lieky užívate?',
    },
    'pzvtqcye': {
      'en': '',
      'sk': '',
    },
    'jv8nw803': {
      'en': 'Start typing name of product...',
      'sk': 'Začnite písať názov produktu...',
    },
    'ugf1tiv5': {
      'en': 'eSKadra form',
      'sk': 'formulár eSKadra',
    },
    '9qhqrx6g': {
      'en': 'Form for REPORTING A SUSPECTED ADVERSE DRUG REACTION)',
      'sk': 'Formulár na HLÁSENIE PODOZRENIA NA NEŽIADUCE ÚČINKY)',
    },
    'v93oi4a3': {
      'en': 'Report it here',
      'sk': 'Nahláste to tu',
    },
  },
  // AvatarMenu
  {
    'c7ui5zar': {
      'en': 'Choose your avatar',
      'sk': 'Vyberte si svojho avatara',
    },
  },
  // PersonalInfo
  {
    'tl0j5ukv': {
      'en': 'Title',
      'sk': 'Názov',
    },
    'ulejwi2y': {
      'en': 'Male',
      'sk': 'Muž',
    },
    'xk29a6ac': {
      'en': 'Female',
      'sk': 'Žena',
    },
    'oa8xf1yu': {
      'en': 'Attack hellicopter',
      'sk': 'Útočná helikoptéra',
    },
    'bdrrcflo': {
      'en': 'Gender',
      'sk': 'Pohlavie',
    },
    'hwg21qi2': {
      'en': 'Search for an item...',
      'sk': 'Vyhľadať položku...',
    },
  },
  // Miscellaneous
  {
    '5zwswdbw': {
      'en': 'Continue without registration',
      'sk': 'Pokračovať bez registrácie',
    },
    '0pmcra0v': {
      'en': 'Camera please',
      'sk': 'Fotoaparát prosím',
    },
    '7amhlqg5': {
      'en': 'PhotoLibrary please',
      'sk': 'Fotoknižnica prosím',
    },
    'pxz62r6y': {
      'en': 'Location please',
      'sk': 'Miesto prosím',
    },
    'octmx5xr': {
      'en': 'Notification please',
      'sk': 'Prosím o oznámenie',
    },
    '0fxz3xex': {
      'en': 'Flahslight please',
      'sk': 'Baterku prosím',
    },
    'dsfk32c2': {
      'en': 'pls microphone',
      'sk': '',
    },
    'm53ynt3i': {
      'en': '',
      'sk': '',
    },
    'r56s8vnj': {
      'en': '',
      'sk': '',
    },
    'jwly6t7z': {
      'en': '',
      'sk': '',
    },
    'o1lkedd9': {
      'en': '',
      'sk': '',
    },
    'itvhoe67': {
      'en': '',
      'sk': '',
    },
    '1jtehehr': {
      'en': '',
      'sk': '',
    },
    'wm16epfg': {
      'en': '',
      'sk': '',
    },
    '22i2mbne': {
      'en': '',
      'sk': '',
    },
    'ies6tw6a': {
      'en': '',
      'sk': '',
    },
    'bn0scing': {
      'en': '',
      'sk': '',
    },
    'b2jq4u4n': {
      'en': '',
      'sk': '',
    },
    'mkslgeq1': {
      'en': '',
      'sk': '',
    },
    'z2a8jwzg': {
      'en': '',
      'sk': '',
    },
    'g3qftkrk': {
      'en': '',
      'sk': '',
    },
    'cxfm5d59': {
      'en': '',
      'sk': '',
    },
    'pydh2weg': {
      'en': '',
      'sk': '',
    },
    'b6zmcsxg': {
      'en': '',
      'sk': '',
    },
    '8fdln5vm': {
      'en': '',
      'sk': '',
    },
    'glwzm40m': {
      'en': '',
      'sk': '',
    },
    'y0wgxavh': {
      'en': '',
      'sk': '',
    },
    '16wdxixo': {
      'en': '',
      'sk': '',
    },
    'gtslzckl': {
      'en': '',
      'sk': '',
    },
    'wvqqpt57': {
      'en': '',
      'sk': '',
    },
    'u9fu37vx': {
      'en': '',
      'sk': '',
    },
    'zvqjmmnb': {
      'en': '',
      'sk': '',
    },
  },
].reduce((a, b) => a..addAll(b));
