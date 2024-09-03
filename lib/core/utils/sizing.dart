import 'package:flutter/material.dart';

class Sizing {
  // Spacing
  static const double line = 1.0;
  static const double tiny = 2.0;
  static const double verySmall = 4.0;
  static const double small = 8.0;
  static const double medium = 12.0;
  static const double halfOfLarge = 16.0;
  static const double lessLarge = 24.0;
  static const double large = 32.0;
  static const double veryLarge = 48.0;
  static const double lessHuge = 56.0;
  static const double huge = 64.0;
  static const double veryHuge = 96.0;

  // Margin
  static const EdgeInsets marginSmall = EdgeInsets.all(small);
  static const EdgeInsets marginMedium = EdgeInsets.all(medium);
  static const EdgeInsets marginLarge = EdgeInsets.all(large);

  // Border Radius
  static BorderRadius borderRadiusAll(double size) {
    return BorderRadius.all(Radius.circular(size));
  }
  static BorderRadius borderRadiusTop(double size) {
    return BorderRadius.vertical(
      top: Radius.circular(size),
    );
  }

  // Heights
  static const double appBarHeight = 56.0;
  static const double buttonHeight = 48.0;

  // Widths
  static const double buttonWidth = 200.0;
  static const double cardWidth = 300.0;

  // Other Sizes
  static const double iconSizeSmall = 24.0;
  static const double iconSizeMedium = 32.0;
  static const double iconSizeLarge = 48.0;
}

// Padding
EdgeInsets setPadding(
    double vertical,
    double horizontal,
) {
  return EdgeInsets.only(
    top: vertical,
    right: horizontal,
    bottom: vertical,
    left: horizontal,
  );
}
EdgeInsets setPaddingAll(double size) {
  return EdgeInsets.all(size);
}
