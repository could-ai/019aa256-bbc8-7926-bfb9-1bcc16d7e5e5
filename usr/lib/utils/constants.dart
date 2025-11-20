import 'package:flutter/material.dart';

class GameColors {
  // الألوان الأساسية
  static const Color backgroundDark = Color(0xFF0A021C);
  static const Color backgroundMid = Color(0xFF1C123A);
  static const Color primaryPurple = Color(0xFF7B61FF);
  static const Color lightBlue = Color(0xFFC2EEFF);
  static const Color textWhite = Color(0xFFF2EFFF);

  // ألوان الموارد
  static const Color health = Color(0xFF34D399);
  static const Color energy = Color(0xFF60A5FA);
  static const Color enemy = Color(0xFFF87171);
  static const Color memory = Color(0xFFFBBF24);

  // ألوان العصور
  static const Color modernNeon = Color(0xFF00D4FF);
  static const Color stoneFire = Color(0xFFFF6B35);
  static const Color medievalGold = Color(0xFFFFD700);
  static const Color brokenRed = Color(0xFF8B0000);
  static const Color futureSky = Color(0xFF00BFFF);
}

class GameTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: GameColors.textWhite,
    fontFamily: 'Cairo', // Assuming Cairo or similar for Arabic support
  );
  
  static const TextStyle button = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: GameColors.textWhite,
  );
}
