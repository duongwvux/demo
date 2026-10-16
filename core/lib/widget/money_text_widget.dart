import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoneyTextWidget extends StatelessWidget {
  const MoneyTextWidget(
    this.value, {
    super.key,
    this.currency = "USD",
    this.locale,
    this.decimalDigits = 2,
    this.style,
    this.prefix,
    this.suffix,
    this.showSign = false,
    this.colorBySign = false,
    this.positiveColor,
    this.negativeColor,
  });

  final num value;
  final String currency;
  final String? locale;
  final int decimalDigits;
  final TextStyle? style;
  final String? prefix;
  final String? suffix;
  final bool showSign;
  final bool colorBySign;
  final Color? positiveColor;
  final Color? negativeColor;

  @override
  Widget build(BuildContext context) {
    final isNegative = value < 0;
    final amount = value.abs();
    final resolvedLocale = locale ?? Localizations.localeOf(context).toString();
    final formatted = NumberFormat.simpleCurrency(
      locale: resolvedLocale,
      name: currency,
      decimalDigits: decimalDigits,
    ).format(amount);

    final sign = isNegative ? "-" : (showSign ? "+" : "");

    final color = colorBySign
        ? (isNegative
              ? (negativeColor ?? Colors.red)
              : (positiveColor ?? Colors.green))
        : style?.color;
    return Text(
      '${prefix ?? ''}$sign$formatted${suffix ?? ''}',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style:
          (style ??
          Theme.of(context).textTheme.bodySmall?.copyWith(color: color)),
    );
  }
}
