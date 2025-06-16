import 'package:flutter/material.dart';
import 'package:home_decor/l10n/arb/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get l10n {
    return AppLocalizations.of(this);
  }

  MaterialLocalizations get materialL10n {
    return MaterialLocalizations.of(this);
  }
}
