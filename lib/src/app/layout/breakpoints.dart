class Breakpoints {
  static const phone = 0.0; // < 600
  static const tablet = 600.0; // 600–1024
  static const desktop = 1024.0; // > 1024
}

extension ScreenSize on double {
  bool get isPhone => this < Breakpoints.tablet;
  bool get isTablet => this >= Breakpoints.tablet && this < Breakpoints.desktop;
  bool get isDesktop => this >= Breakpoints.desktop;
}
