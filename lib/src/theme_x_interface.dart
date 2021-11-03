import 'package:flutter/material.dart';

import 'mixins/color_mixin.dart';
import 'mixins/textstyle_mixin.dart';

abstract class IThemeX with ColorMixin, TextStyleMixin {
  ThemeData get();
  Color contrastColor(Color backgroundColor);
  String toHex8(Color color);
}
