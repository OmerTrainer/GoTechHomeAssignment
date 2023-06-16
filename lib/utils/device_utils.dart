import 'package:flutter/material.dart';

/// Helper class for device related operations.
class DeviceUtils {
  /// Accepts a double [scale] and returns scaled sized based on the screen
  /// orientation
  static double getScaledSize(BuildContext ctx, double scale) {
    return scale *
        (MediaQuery.of(ctx).orientation == Orientation.portrait
            ? MediaQuery.of(ctx).size.width
            : MediaQuery.of(ctx).size.height);
  }

  /// Accepts a double [scale] and returns scaled sized based on the screen
  /// width
  static double getScaledWidth(BuildContext ctx, double scale) =>
      scale * MediaQuery.of(ctx).size.width;

  /// Accepts a double [scale] and returns scaled sized based on the screen
  /// height
  static double getScaledHeight(BuildContext ctx, double scale) =>
      scale * MediaQuery.of(ctx).size.height;

  /// Accepts a double [scale] and returns scaled font size based on the screen
  /// size & orientation
  static double getScaledFontSize(BuildContext ctx, double scale) =>
      getScaledSize(ctx, scale) * 0.0027;
}
