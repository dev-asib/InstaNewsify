import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:insta_newsify/core/constants/ColorPalette/light_shades/light_shades_app_colors.dart';
import 'package:intl/intl.dart';

class Utils {
  static String dateTimeFormat(String dateTime) {
    DateTime? parseDate = DateTime.tryParse(dateTime);

    if (parseDate != null) {
      return DateFormat.yMEd().add_jms().format(parseDate);
    } else {
      return 'Invalid date format';
    }
  }

  static void flushBarErrorMessage(BuildContext context, String message,
      {String? title}) {
    Flushbar(
      message: message,
      backgroundColor: LightShadesAppColors.flushBarBackgroundColor,
      messageColor: LightShadesAppColors.flushBarMessageColor,
      messageSize: 20,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(16),
      borderRadius: BorderRadius.circular(16),
      forwardAnimationCurve: Curves.easeInOut,
      positionOffset: 20,
      flushbarPosition: FlushbarPosition.TOP,
      icon: const Icon(
        Icons.error,
        size: 28,
        color: LightShadesAppColors.flushBarIconColor,
      ),
    ).show(context);
  }
}
