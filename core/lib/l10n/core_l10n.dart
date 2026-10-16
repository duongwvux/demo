library;

import 'package:flutter/widgets.dart';

import 'generated/core_localizations.dart';

export 'generated/core_localizations.dart';
extension CoreLocalizationContext on BuildContext {
  CoreLocalizations get coreL10n => CoreLocalizations.of(this)!;
}
