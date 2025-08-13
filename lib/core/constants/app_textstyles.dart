import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle title({
    double fontSize = 16,
    Color color = Colors.black,
    FontWeight weight = FontWeight.w600,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      fontWeight: weight,
      color: color,
    );
  }

  static TextStyle prepTime({double fontSize = 14, Color? color}) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.grey[700],
    );
  }

  static TextStyle desc({
    double fontSize = 14,
    Color? color,
    double height = 1.4,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
      color: color ?? Colors.grey[600],
      height: height,
    );
  }
}
