import 'package:flutter/widgets.dart';

import '../color/text_color.dart';

class FormTextStyle {
  FormTextStyle._();

  static TextStyle screenTitle() {
    return TextStyle(
        color: TextColor.textPrimary(),
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 19
    );
  }

  static TextStyle sectionTitle(String? value) {
    return TextStyle(
        color: TextColor.textPrimary(),
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 19
    );
  }

  static TextStyle assetLabel(String? value) {
    return TextStyle(
      color: TextColor.textPrimary(),
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 17,
    );
  }

  static TextStyle bodyRegular(String? value) {
    return TextStyle(
      color: TextColor.textSecondary(),
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 17,
    );
  }

  static TextStyle amountMedium(String? value) {
    return TextStyle(
      color: TextColor.textPrimary(),
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 21,
    );
  }

  static TextStyle captionRegular(String? value) {
    return TextStyle(
      color: TextColor.textSecondary(),
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 14,
    );
  }

  static TextStyle chartLabel(String? value) {
    return TextStyle(
      color: TextColor.textSecondary(),
      fontWeight: FontWeight.w600,
      fontSize: 12,
      height: 14,
    );
  }

  static TextStyle controlLabel(String? value) {
    return TextStyle(
      color: TextColor.textPrimary(),
      fontWeight: FontWeight.w600,
      fontSize: 12,
      height: 14,
    );
  }

  static TextStyle assetPriceLarge(String? value) {
    return TextStyle(
      color: TextColor.textPrimary(),
      fontSize: 36,
      fontWeight: FontWeight.w500,
      height: 43,
    );
  }

  static TextStyle spendingTotal(String? value) {
    return TextStyle(
      color: TextColor.textPrimary(),
      fontWeight: FontWeight.w600,
      fontSize: 48,
      height: 57,
    );
  }

  static TextStyle increasePrimary(String? value) {
    return TextStyle(
      color: TextColor.priceUp(),
      fontSize: 12,
      height: 14,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle increaseSecondary(String? value) {
    return TextStyle(
      color: TextColor.priceUp(),
      fontSize: 14,
      height: 17,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle increaseThird(String? value) {
    return TextStyle(
      color: TextColor.priceUp(),
      fontSize: 18,
      height: 21,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle decreasePrimary(String? value) {
    return TextStyle(
      color: TextColor.priceDown(),
      fontSize: 12,
      height: 14,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle decreaseSecondary(String? value) {
    return TextStyle(
      color: TextColor.priceDown(),
      fontSize: 14,
      height: 17,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle decreaseThird(String? value) {
    return TextStyle(
      color: TextColor.priceDown(),
      fontSize: 18,
      height: 21,
      fontWeight: FontWeight.w500,
    );
  }
}