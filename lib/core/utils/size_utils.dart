import 'package:get/get.dart';

class SizeUtils {
  // Design base size (iPhone X/11 Pro/13 Mini standard)
  static const double designWidth = 375.0;
  static const double designHeight = 812.0;

  static double get screenWidth => Get.width;
  static double get screenHeight => Get.height;

  static double get scaleWidth => screenWidth / designWidth;
  static double get scaleHeight => screenHeight / designHeight;

  // Adapt text size based on min scale to avoid too small or too large text
  static double get scaleText =>
      scaleWidth < scaleHeight ? scaleWidth : scaleHeight;

  static double setWidth(num width) => width * scaleWidth;
  static double setHeight(num height) => height * scaleHeight;
  static double setSp(num fontSize) => fontSize * scaleText;
}

extension SizeExtension on num {
  double get w => SizeUtils.setWidth(this);
  double get h => SizeUtils.setHeight(this);
  double get sp => SizeUtils.setSp(this);
}
