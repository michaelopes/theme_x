import 'dart:ui';

import 'package:flutter/material.dart';

import 'tinycolor/tinycolor.dart';

enum ColorGeneratorAlgorithm { constantin, buckner, traditional, complementary }

class ColorGeneratorResult {
  MaterialColor primary;
  MaterialColor secondary;
  MaterialColor grey;

  ColorGeneratorResult({
    required this.primary,
    required this.secondary,
    required this.grey,
  });
}

class ColorGenerator {
  TinyColor multiply(Color color1, Color color2) {
    var b = (color1.blue * color2.blue / 255).floor();
    var g = (color1.green * color2.green / 255).floor();
    var r = (color1.red * color2.red / 255).floor();
    return TinyColor(Color.fromARGB(255, r, g, b));
  }

  ColorGeneratorResult computeColors({
    required Color color,
    ColorGeneratorAlgorithm algorithm = ColorGeneratorAlgorithm.constantin,
  }) {
    if (algorithm == ColorGeneratorAlgorithm.constantin) {
      var baseLight = TinyColor.fromString('#ffffff');
      var baseDark = multiply(color, color);
      var main = baseLight.mix(input: color, amount: 100);

      var primary = MaterialColor(
        int.parse("0x${main.toHex8()}"),
        <int, Color>{
          50: baseLight.mix(input: color, amount: 12).color,
          100: baseLight.mix(input: color, amount: 30).color,
          200: baseLight.mix(input: color, amount: 50).color,
          300: baseLight.mix(input: color, amount: 70).color,
          400: baseLight.mix(input: color, amount: 85).color,
          500: main.color,
          600: baseDark.mix(input: color, amount: 87).color,
          700: baseDark.mix(input: color, amount: 70).color,
          800: baseDark.mix(input: color, amount: 54).color,
          900: baseDark.mix(input: color, amount: 25).color,
        },
      );

      var spinColor = TinyColor.fromString('#000000');
      var secundaryMain = baseDark
          .mix(input: spinColor.color, amount: 15)
          .saturate(80)
          .lighten(55);

      var secundary = MaterialColor(
        int.parse("0x${secundaryMain.toHex8()}"),
        <int, Color>{
          100: baseDark
              .mix(input: spinColor.color, amount: 15)
              .saturate(80)
              .lighten(65)
              .color,
          200: secundaryMain.color,
          400: baseDark
              .mix(input: spinColor.color, amount: 15)
              .saturate(100)
              .lighten(45)
              .color,
          700: baseDark
              .mix(input: spinColor.color, amount: 15)
              .saturate(100)
              .lighten(40)
              .color,
        },
      );
      return ColorGeneratorResult(
        primary: primary,
        secondary: secundary,
        grey: _getGrey(color, algorithm),
      );
    } else if (algorithm == ColorGeneratorAlgorithm.buckner) {
      var baseLight = TinyColor.fromString('#ffffff');
      var baseDark = multiply(color, color);

      var main = baseLight.mix(input: color, amount: 100);
      var primary = MaterialColor(
        int.parse("0x${main.toHex8()}"),
        <int, Color>{
          50: baseLight.mix(input: color, amount: 12).color,
          100: baseLight.mix(input: color, amount: 30).color,
          200: baseLight.mix(input: color, amount: 50).color,
          300: baseLight.mix(input: color, amount: 70).color,
          400: baseLight.mix(input: color, amount: 85).color,
          500: main.color,
          600: baseDark.mix(input: color, amount: 87).color,
          700: baseDark.mix(input: color, amount: 70).color,
          800: baseDark.mix(input: color, amount: 54).color,
          900: baseDark.mix(input: color, amount: 25).color,
        },
      );

      var spinColor = TinyColor(color).spin(270);

      var secundaryMain = baseDark
          .mix(input: spinColor.color, amount: 15)
          .saturate(80)
          .lighten(36);

      var secundary = MaterialColor(
        int.parse("0x${secundaryMain.toHex8()}"),
        <int, Color>{
          100: baseDark
              .mix(input: spinColor.color, amount: 15)
              .saturate(80)
              .lighten(48)
              .color,
          200: secundaryMain.color,
          400: baseDark
              .mix(input: spinColor.color, amount: 15)
              .saturate(100)
              .lighten(31)
              .color,
          700: baseDark
              .mix(input: spinColor.color, amount: 15)
              .saturate(100)
              .lighten(28)
              .color,
        },
      );
      return ColorGeneratorResult(
        primary: primary,
        secondary: secundary,
        grey: _getGrey(color, algorithm),
      );
    } else if (algorithm == ColorGeneratorAlgorithm.complementary) {
      var baseLight = TinyColor.fromString('#ffffff');
      var baseDark = multiply(color, color);
      var main = baseLight.mix(input: color, amount: 100);

      var primary = MaterialColor(
        int.parse("0x${main.toHex8()}"),
        <int, Color>{
          50: baseLight.mix(input: color, amount: 12).color,
          100: baseLight.mix(input: color, amount: 30).color,
          200: baseLight.mix(input: color, amount: 50).color,
          300: baseLight.mix(input: color, amount: 70).color,
          400: baseLight.mix(input: color, amount: 85).color,
          500: main.color,
          600: baseDark.mix(input: color, amount: 87).color,
          700: baseDark.mix(input: color, amount: 70).color,
          800: baseDark.mix(input: color, amount: 54).color,
          900: baseDark.mix(input: color, amount: 25).color,
        },
      );

      //  var mainSecondary = main.spin(-53).lighten(3).saturate(-25);
      var mainSecondary = main.spin(-89).lighten(-4).saturate(-3);
      var secundary = MaterialColor(
        int.parse("0x${mainSecondary.toHex8()}"),
        <int, Color>{
          100: main
              .spin(-93)
              .lighten(22)
              .saturate(-21)
              .color, //main.spin(-69).lighten(35).saturate(4).color,
          200: mainSecondary.color,
          400: main
              .spin(-90)
              .lighten(-6)
              .saturate(-29)
              .color, //main.spin(-47).lighten(-9).saturate(-39).color,
          700: main
              .spin(-85)
              .lighten(-16)
              .saturate(-25)
              .color, //main.spin(-43).lighten(-20).saturate(-33).color,
        },
      );
      return ColorGeneratorResult(
        primary: primary,
        secondary: secundary,
        grey: _getGrey(color, algorithm),
      );
    } else {
      var tinycolor = TinyColor(color);
      var primary = MaterialColor(
        int.parse("0x${tinycolor.toHex8()}"),
        <int, Color>{
          50: tinycolor.lighten(52).color,
          100: tinycolor.lighten(37).color,
          200: tinycolor.lighten(26).color,
          300: tinycolor.lighten(12).color,
          400: tinycolor.lighten(6).color,
          500: tinycolor.color,
          600: tinycolor.darken(6).color,
          700: tinycolor.darken(12).color,
          800: tinycolor.darken(18).color,
          900: tinycolor.darken(24).color,
        },
      );
      var mainSecondary = tinycolor.lighten(30).saturate(30);
      var secundary = MaterialColor(
        int.parse("0x${mainSecondary.toHex8()}"),
        <int, Color>{
          100: tinycolor.lighten(50).saturate(30).color,
          200: mainSecondary.color,
          400: tinycolor.lighten(15).saturate(15).color,
          700: tinycolor.lighten(5).saturate(5).color,
        },
      );
      return ColorGeneratorResult(
        primary: primary,
        secondary: secundary,
        grey: _getGrey(color, algorithm),
      );
    }
  }

  MaterialColor _getGrey(Color color, ColorGeneratorAlgorithm algorithm) {
    color = TinyColor(color).greyscale().color;

    if (algorithm == ColorGeneratorAlgorithm.constantin) {
      var baseLight = TinyColor.fromString('#ffffff');
      var baseDark = multiply(color, color);
      var main = baseLight.mix(input: color, amount: 100);

      return MaterialColor(
        int.parse("0x${main.toHex8()}"),
        <int, Color>{
          50: baseLight.mix(input: color, amount: 12).color,
          100: baseLight.mix(input: color, amount: 30).color,
          200: baseLight.mix(input: color, amount: 50).color,
          300: baseLight.mix(input: color, amount: 70).color,
          400: baseLight.mix(input: color, amount: 85).color,
          500: main.color,
          600: baseDark.mix(input: color, amount: 87).color,
          700: baseDark.mix(input: color, amount: 70).color,
          800: baseDark.mix(input: color, amount: 54).color,
          900: baseDark.mix(input: color, amount: 25).color,
        },
      );
    } else if (algorithm == ColorGeneratorAlgorithm.buckner) {
      var baseLight = TinyColor.fromString('#ffffff');
      var baseDark = multiply(color, color);
      var main = baseLight.mix(input: color, amount: 100);
      return MaterialColor(
        int.parse("0x${main.toHex8()}"),
        <int, Color>{
          50: baseLight.mix(input: color, amount: 12).color,
          100: baseLight.mix(input: color, amount: 30).color,
          200: baseLight.mix(input: color, amount: 50).color,
          300: baseLight.mix(input: color, amount: 70).color,
          400: baseLight.mix(input: color, amount: 85).color,
          500: main.color,
          600: baseDark.mix(input: color, amount: 87).color,
          700: baseDark.mix(input: color, amount: 70).color,
          800: baseDark.mix(input: color, amount: 54).color,
          900: baseDark.mix(input: color, amount: 25).color,
        },
      );
    } else {
      var tinycolor = TinyColor(color);
      return MaterialColor(
        int.parse("0x${tinycolor.toHex8()}"),
        <int, Color>{
          50: tinycolor.lighten(52).color,
          100: tinycolor.lighten(37).color,
          200: tinycolor.lighten(26).color,
          300: tinycolor.lighten(12).color,
          400: tinycolor.lighten(6).color,
          500: tinycolor.color,
          600: tinycolor.darken(6).color,
          700: tinycolor.darken(12).color,
          800: tinycolor.darken(18).color,
          900: tinycolor.darken(24).color,
        },
      );
    }
  }

  Color contrastColor(Color backgroundColor) {
    var tinyColor = TinyColor(backgroundColor);
    return tinyColor.isLight()
        ? Colors.black.withOpacity(0.9)
        : Colors.white.withOpacity(0.9);
  }
}
