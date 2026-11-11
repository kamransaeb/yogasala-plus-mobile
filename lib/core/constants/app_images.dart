/// This class is used to create a assets images for the app.
///
/// Usage:
/// ```dart
/// AppImages.introPageBackground;
/// AppImages.pageBackground;
/// ```
class AppImages {
  AppImages._();

  static const String _images = 'assets/images';

  /// Intro page background.
  static const String introPageBackground =
      '$_images/intro_page_background.png';

  /// Page background.
  static const String pageBackground = '$_images/page_background_black.jpg';
}
