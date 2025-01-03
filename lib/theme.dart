import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF4A90E2); // Example primary color
  static const Color secondaryColor = Color(0xFF50E3C2); // Example secondary color
  static const Color accentColor = Color(0xFFFFC107); // Example accent color
  static const Color backgroundColor = Color(0xFFF5F5F5); // Light background
  static const Color textColor = Color(0xFF333333); // Dark text
}

class AppTypography {
  static const TextStyle headline1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
} 