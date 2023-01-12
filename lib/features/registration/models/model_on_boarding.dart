import 'dart:ui';

class OnBoardingModel {
  final String svgImage;
  final String title;
  final String subtitle;
  final String counterText;
  final Color bgColor;
  final double height;

  OnBoardingModel(
      {required this.svgImage,
      required this.title,
      required this.subtitle,
      required this.counterText,
      required this.bgColor,
      required this.height});
}
