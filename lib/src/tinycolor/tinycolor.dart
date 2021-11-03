import 'dart:math' as math;
import 'dart:ui' show Color;

import 'package:flutter/painting.dart' show HSLColor, HSVColor;
import 'package:pigment/pigment.dart';

import 'util.dart';

class TinyColor {
  final Color originalColor;
  Color _color;

  TinyColor(this.originalColor) : _color = originalColor.clone();

  factory TinyColor.fromRGB({
    required int r,
    required int g,
    required int b,
    int a = 100,
  }) =>
      TinyColor(Color.fromARGB(a, r, g, b));

  factory TinyColor.fromHSL(HSLColor hsl) => TinyColor(hsl.toColor());

  factory TinyColor.fromHSV(HSVColor hsv) => TinyColor(hsv.toColor());

  factory TinyColor.fromString(String string) =>
      TinyColor(Pigment.fromString(string));

  bool isDark() => getBrightness() < 128.0;

  bool isLight() => !isDark();

  double getBrightness() =>
      (_color.red * 299 + _color.green * 587 + _color.blue * 114) / 1000;

  double getLuminance() => _color.computeLuminance();

  TinyColor setAlpha(int alpha) {
    _color = _color.withAlpha(alpha);
    return this;
  }

  TinyColor setOpacity(double opacity) {
    _color = _color.withOpacity(opacity);
    return this;
  }

  HSVColor toHsv() => HSVColor.fromColor(_color);

  HSLColor toHsl() => HSLColor.fromColor(_color);

  String toHex8() => _color.value.toRadixString(16).padLeft(8, '0');

  TinyColor clone() => TinyColor(_color);

  TinyColor lighten([int amount = 10]) {
    final hsl = toHsl();
    final lightness = clamp01(hsl.lightness + amount / 100);
    return TinyColor.fromHSL(hsl.withLightness(lightness));
  }

  TinyColor brighten([int amount = 10]) {
    final color = Color.fromARGB(
      _color.alpha,
      math.max(
        0,
        math.min(
          255,
          _color.red - (255 * -(amount / 100)).round(),
        ),
      ),
      math.max(
        0,
        math.min(
          255,
          _color.green - (255 * -(amount / 100)).round(),
        ),
      ),
      math.max(
        0,
        math.min(
          255,
          _color.blue - (255 * -(amount / 100)).round(),
        ),
      ),
    );
    return TinyColor(color);
  }

  TinyColor darken([int amount = 10]) {
    final hsl = toHsl();
    final lightness = clamp01(hsl.lightness - amount / 100);
    return TinyColor.fromHSL(hsl.withLightness(lightness));
  }

  TinyColor tint([int amount = 10]) => mix(
        input: const Color.fromRGBO(255, 255, 255, 1.0),
        amount: amount,
      );

  TinyColor shade([int amount = 10]) => mix(
        input: const Color.fromRGBO(0, 0, 0, 1.0),
        amount: amount,
      );

  TinyColor desaturate([int amount = 10]) {
    final hsl = toHsl();
    final saturation = clamp01(hsl.saturation - amount / 100);
    return TinyColor.fromHSL(hsl.withSaturation(saturation));
  }

  TinyColor saturate([int amount = 10]) {
    final hsl = toHsl();
    final saturation = clamp01(hsl.saturation + amount / 100);
    return TinyColor.fromHSL(hsl.withSaturation(saturation));
  }

  TinyColor greyscale() => desaturate(100);

  TinyColor spin(double amount) {
    final hsl = toHsl();
    final hue = (hsl.hue + amount) % 360;
    return TinyColor.fromHSL(hsl.withHue(hue < 0 ? 360 + hue : hue));
  }

  TinyColor mix({
    required Color input,
    int amount = 50,
  }) {
    final p = amount / 100.0;
    final color = Color.fromARGB(
        ((input.alpha - _color.alpha) * p + _color.alpha).round(),
        ((input.red - _color.red) * p + _color.red).round(),
        ((input.green - _color.green) * p + _color.green).round(),
        ((input.blue - _color.blue) * p + _color.blue).round());
    return TinyColor(color);
  }

  TinyColor complement() {
    final hsl = toHsl();
    final hue = (hsl.hue + 180) % 360;
    return TinyColor.fromHSL(hsl.withHue(hue));
  }

  Color get color => _color;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TinyColor &&
          runtimeType == other.runtimeType &&
          color == other.color;

  @override
  int get hashCode => color.hashCode;

  @Deprecated('Use == instead.')
  bool equals(Object other) => this == other;
}

extension _ColorExtension on Color {
  Color clone() => Color.fromARGB(alpha, red, green, blue);
}
