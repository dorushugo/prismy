import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'en'];

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
    String? frText = '',
    String? enText = '',
  }) =>
      [frText, enText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SignUp
  {
    'htozgnzg': {
      'fr': 'Inscription',
      'en': '',
    },
    'wwh7btmk': {
      'fr': 'Email',
      'en': '',
    },
    '8upe38hy': {
      'fr': 'exemple@mail.fr',
      'en': '',
    },
    'ccbn2udp': {
      'fr': 'Mot de passe',
      'en': '',
    },
    'nwx3rnf6': {
      'fr': '***********',
      'en': '',
    },
    'bkc2as15': {
      'fr': 'Confirmer le mot de passe',
      'en': '',
    },
    'l0yt3h1c': {
      'fr': '***********',
      'en': '',
    },
    '3uxfskoo': {
      'fr': 'Créer mon compte',
      'en': '',
    },
    'x2b43cdq': {
      'fr': 'ou ',
      'en': '',
    },
    'llcy4nxg': {
      'fr': 'Se connecter avec Google',
      'en': '',
    },
    'sl27971j': {
      'fr': 'Vous avez déjà un compte ? ',
      'en': '',
    },
    '1lhh4jcp': {
      'fr': 'Connectez-vous',
      'en': '',
    },
    'ex4tyt6o': {
      'fr': 'Se connecter avec Apple',
      'en': '',
    },
    'ahx9fkwe': {
      'fr': 'Connexion',
      'en': '',
    },
  },
  // Home
  {
    'gufgzrg4': {
      'fr': 'Mes checkups',
      'en': '',
    },
    'uavcc2mh': {
      'fr': '?',
      'en': '',
    },
    'me71qbeu': {
      'fr': '?',
      'en': '',
    },
    '8hp25jgf': {
      'fr': '?',
      'en': '',
    },
    'xswwa0xl': {
      'fr': 'Aucun checkup ce jour',
      'en': '',
    },
    'k3y5xtaf': {
      'fr': '',
      'en': '',
    },
    '6a6s8eoy': {
      'fr': 'Lvl \n18',
      'en': '',
    },
    'sppi8x0g': {
      'fr': 'Votre plante à grandit aujourd’hui !',
      'en': '',
    },
    '3ttzjilz': {
      'fr': 'Vos photos',
      'en': '',
    },
    '4mdfp32n': {
      'fr': 'Aucune photo ce jour',
      'en': '',
    },
    'j7j4gqgi': {
      'fr': 'Aucun Checkup ce jour',
      'en': '',
    },
    '77p51il9': {
      'fr': 'Note du jour',
      'en': '',
    },
    '95h4naoe': {
      'fr': '',
      'en': '',
    },
    'm298ew5p': {
      'fr': 'Ajouter une note',
      'en': '',
    },
    '9ihc48fn': {
      'fr': 'Home',
      'en': '',
    },
  },
  // Login
  {
    'yqvzljqq': {
      'fr': 'Connexion',
      'en': '',
    },
    'zvfg0c0e': {
      'fr': 'Email',
      'en': '',
    },
    '92k0x397': {
      'fr': 'exemple@mail.fr',
      'en': '',
    },
    '17eowkw4': {
      'fr': 'Mot de passe',
      'en': '',
    },
    'h23iy3z9': {
      'fr': '***********',
      'en': '',
    },
    'mb0e3wdj': {
      'fr': 'Mot de passe oublié ?',
      'en': '',
    },
    'hvkl87fd': {
      'fr': 'Connexion',
      'en': '',
    },
    '8ihewgoa': {
      'fr': 'ou',
      'en': '',
    },
    'a6ge5yjj': {
      'fr': 'Se connecter avec Google',
      'en': '',
    },
    'wzbm65xl': {
      'fr': 'Vous n\'avez pas de compte ? ',
      'en': '',
    },
    'yv63ro7a': {
      'fr': 'Inscrivez-vous ici',
      'en': '',
    },
    'ije4x8t0': {
      'fr': 'Se connecter avec Apple',
      'en': '',
    },
    'entr9ul7': {
      'fr': 'Connexion',
      'en': '',
    },
  },
  // Profil
  {
    '6591rwj1': {
      'fr': 'Mon compte',
      'en': '',
    },
    'mglko85s': {
      'fr': 'Se déconnecter',
      'en': '',
    },
    'aw3yb6gd': {
      'fr': 'Supprimer mon compte',
      'en': '',
    },
    'p0jik5fe': {
      'fr': 'Home',
      'en': '',
    },
  },
  // Parametres
  {
    'fcbijkae': {
      'fr': 'Paramètres',
      'en': '',
    },
    '83f1zf8r': {
      'fr': 'Notifications',
      'en': '',
    },
    'xarpxnrz': {
      'fr': 'Langue',
      'en': '',
    },
    'cn15gf2e': {
      'fr': 'Politique de confidentialité',
      'en': '',
    },
    '34fx05lp': {
      'fr': 'À propos de l\'application ',
      'en': '',
    },
    'k6jdco6v': {
      'fr': 'Home',
      'en': '',
    },
  },
  // Slider
  {
    '3dpfgyp8': {
      'fr': 'Page Title',
      'en': '',
    },
    '3l4btv7d': {
      'fr': 'Home',
      'en': '',
    },
  },
  // RegisterChekup
  {
    'js5djlkn': {
      'fr': 'Checkup du jour',
      'en': '',
    },
    'ebigdmgj': {
      'fr': 'Votre humeur',
      'en': '',
    },
    'ir8f3uvl': {
      'fr': 'Vos photos',
      'en': '',
    },
    'wzfjkkam': {
      'fr': 'Aucune photo ce jour',
      'en': '',
    },
    '3nnwmu57': {
      'fr': 'Ajouter une photo',
      'en': '',
    },
    'i160mq6u': {
      'fr': 'Note du jour',
      'en': '',
    },
    'bahp9k9b': {
      'fr': '',
      'en': '',
    },
    '3hwy8ttr': {
      'fr': 'Ajouter une note',
      'en': '',
    },
    'aqzjppp5': {
      'fr': 'Enregistrer',
      'en': '',
    },
    'cls0rave': {
      'fr': 'Home',
      'en': '',
    },
  },
  // ChoixLanguages
  {
    '5h23cveo': {
      'fr':
          'Choisissez la langue que vous souhaitez utiliser dans l\'application.',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '35z1sfkb': {
      'fr': 'Button',
      'en': '',
    },
    'mgmc7kf5': {
      'fr': '',
      'en': '',
    },
    '1xtkww3d': {
      'fr': 'Un mail de réinitialisation du mot de passe vous a été envoyé !',
      'en': 'A password reset email has been sent to you!',
    },
    '680mxjql': {
      'fr': 'Email requis',
      'en': 'Email required',
    },
    '65nkkqiw': {
      'fr': 'Les numéro de téléphone doivent commencer par +..',
      'en': 'Telephone numbers must start with +..',
    },
    'fi6ljajn': {
      'fr': 'Les mots de passe doivent être identiques',
      'en': 'Passwords must be the same',
    },
    '4nhbexg6': {
      'fr': 'Entrer le code de vérification SMS',
      'en': 'Enter SMS verification code',
    },
    'b0azn8zo': {
      'fr': '',
      'en': '',
    },
    'cnrwyrb4': {
      'fr': '',
      'en': '',
    },
    'wkale4oa': {
      'fr': 'Email de changement de mot de passe envoyé',
      'en': 'Password change email sent',
    },
    'w4yce5yo': {
      'fr': 'Cet email est déjà utilisé',
      'en': 'This email is already in use',
    },
    '7bvo83sd': {
      'fr': 'Identitifiants incorrects',
      'en': 'Incorrect identifiers',
    },
    '0w2ux1p0': {
      'fr': '',
      'en': '',
    },
    '7vccmjq7': {
      'fr': '',
      'en': '',
    },
    'xamwn27o': {
      'fr': '',
      'en': '',
    },
    'jc3xagl1': {
      'fr': '',
      'en': '',
    },
    'xhrfo2v8': {
      'fr': '',
      'en': '',
    },
    'x43ejgxw': {
      'fr': '',
      'en': '',
    },
    'd0dd11um': {
      'fr': '',
      'en': '',
    },
    'wmoz39zr': {
      'fr': '',
      'en': '',
    },
    'rrxcf8u4': {
      'fr': '',
      'en': '',
    },
    'px7n5ve8': {
      'fr': '',
      'en': '',
    },
    'engdjebw': {
      'fr': '',
      'en': '',
    },
    '7m18gjev': {
      'fr': '',
      'en': '',
    },
    'yr40con3': {
      'fr': '',
      'en': '',
    },
    '7chfhqe5': {
      'fr': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
