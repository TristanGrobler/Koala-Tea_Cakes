class K {
  static const double maxContentWidth = 900;
  static const double minContentWidth = 600;

  static double adaptiveWidth(double width,
      [double scaleFactor = maxContentWidth]) {
    if (width > maxContentWidth) return scaleFactor;
    return width / maxContentWidth * scaleFactor;
  }
}
