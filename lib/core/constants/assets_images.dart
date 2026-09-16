/// This class is used to create a assets images for the app.
///
/// Usage:
/// ```dart
/// AssetsImages.introPageBackground;
/// AssetsImages.pageBackground;
/// ```
class AssetsImages {
  AssetsImages._();

  static const String _images = 'assets/images';

  /// Intro page background.
  static const String introPageBackground =
      '$_images/intro_page_background.png';

  /// Page background.
  static const String pageBackground = '$_images/page_background_black.jpg';
}
