import 'package:flutter/material.dart';

Map<String, dynamic> getElegantColors(int score) {
  int maxScore = 900;
  if (score < (maxScore * 0.25)) {
    return {
      "gradientColors": [const Color(0xFF2A1F1D), const Color(0xFF121212)],
      "primaryColor": const Color(0xFFD16B6B),
      "secondaryColor": const Color(0xFFD16B6B).withAlpha(180),
      "shadowColor": Colors.black.withAlpha(38),
      "speedometerColors": [const Color(0xFFD16B6B), const Color(0xFFB35656)],
      "pointerColor": const Color(0xFFD16B6B),
      "tileBackground": const Color(0xFF1C1C1C),
      "tileBorder": Colors.transparent,
      "tileShadow": Colors.black.withAlpha(26),
    };
  } else if (score < (maxScore * 0.50)) {
    return {
      "gradientColors": [const Color(0xFF2E241E), const Color(0xFF121212)],
      "primaryColor": const Color(0xFFE08F62),
      "secondaryColor": const Color(0xFFE08F62).withAlpha(180),
      "shadowColor": Colors.black.withAlpha(38),
      "speedometerColors": [const Color(0xFFE08F62), const Color(0xFFC77B50)],
      "pointerColor": const Color(0xFFE08F62),
      "tileBackground": const Color(0xFF1C1C1C),
      "tileBorder": Colors.transparent,
      "tileShadow": Colors.black.withAlpha(26),
    };
  } else if (score < (maxScore * 0.75)) {
    return {
      "gradientColors": [const Color(0xFF2A261B), const Color(0xFF121212)],
      "primaryColor": const Color(0xFFD4B483),
      "secondaryColor": const Color(0xFFD4B483).withAlpha(180),
      "shadowColor": Colors.black.withAlpha(38),
      "speedometerColors": [const Color(0xFFD4B483), const Color(0xFFC1A16D)],
      "pointerColor": const Color(0xFFD4B483),
      "tileBackground": const Color(0xFF1C1C1C),
      "tileBorder": Colors.transparent,
      "tileShadow": Colors.black.withAlpha(26),
    };
  } else if (score <= (maxScore * 1)) {
    return {
      "gradientColors": [const Color(0xFF1E2A21), const Color.fromARGB(255, 18, 18, 18)],
      "primaryColor": const Color(0xFFA9D18E),
      "secondaryColor": const Color(0xFFA9D18E).withAlpha(180),
      "shadowColor": Colors.black.withAlpha(38),
      "speedometerColors": [const Color(0xFFA9D18E), const Color(0xFF90B97A)],
      "pointerColor": const Color(0xFFA9D18E),
      "tileBackground": const Color(0xFF1C1C1C),
      "tileBorder": Colors.transparent,
      "tileShadow": Colors.black.withAlpha(26),
    };
  } else {
    return {
      "gradientColors": [const Color(0xFF1D262A), const Color.fromARGB(255, 18, 18, 18)],
      "primaryColor": const Color(0xFF9AC6E0),
      "secondaryColor": const Color(0xFF9AC6E0).withAlpha(180),
      "shadowColor": Colors.black.withAlpha(38),
      "speedometerColors": [const Color(0xFF9AC6E0), const Color(0xFF7DA8C3)],
      "pointerColor": const Color(0xFF9AC6E0),
      "tileBackground": const Color(0xFF1C1C1C),
      "tileBorder": Colors.transparent,
      "tileShadow": Colors.black.withAlpha(26),
    };
  }
}
