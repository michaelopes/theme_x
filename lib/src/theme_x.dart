import 'package:flutter/material.dart';
import 'color_generator.dart';
import 'theme_x_interface.dart';
import 'tinycolor/tinycolor.dart';

enum ThemeXColorEngine { constantin, buckner, traditional, complementary }

typedef BackgroundResover = Color Function(
    MaterialColor primary, MaterialColor secondary, MaterialColor grey);

typedef GoogleFontsResover = TextTheme Function([TextTheme? textTheme]);

class ThemeX implements IThemeX {
  static final ThemeX _inst = ThemeX._internal();
  static ThemeX get I => _inst;
  ThemeX._internal();

  factory ThemeX({
    required Brightness brightness,
    ThemeXColorEngine colorEngine = ThemeXColorEngine.constantin,
    BackgroundResover? backgroundColor,
    GoogleFontsResover? googleFont,
    Color? primaryColor,
    String? fontFamily,
    Color? success,
    Color? danger,
    Color? warning,
    Color? info,
    Color? secondarySuccess,
    Color? secondaryDanger,
    Color? secondaryWarning,
    Color? secondaryInfo,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? buttonLarge,
    TextStyle? buttonMedium,
    TextStyle? subtitleLarge,
    TextStyle? subtitleMedium,
    TextStyle? caption,
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
    TextStyle? h5,
    ButtonStyle? elevatedButtonStyle,
    ButtonStyle? outlinedButtonStyle,
    InputDecorationTheme? inputDecorationTheme,
  }) {
    _inst._brightness = brightness;
    _inst._backgroundColor = backgroundColor;
    _inst._fontFamily = fontFamily;
    _inst._colorEngine = colorEngine;
    _inst._bodyLarge = bodyLarge;
    _inst._bodyMedium = bodyMedium;
    _inst._buttonLarge = buttonLarge;
    _inst._buttonMedium = buttonMedium;
    _inst._subtitleLarge = subtitleLarge;
    _inst._subtitleMedium = subtitleMedium;
    _inst._caption = caption;
    _inst._h1 = h1;
    _inst._h2 = h2;
    _inst._h3 = h3;
    _inst._h4 = h4;
    _inst._h5 = h5;
    _inst._success = success;
    _inst._danger = danger;
    _inst._warning = warning;
    _inst._info = info;
    _inst._secondarySuccess = secondarySuccess;
    _inst._secondaryDanger = secondaryDanger;
    _inst._secondaryWarning = secondaryWarning;
    _inst._secondaryInfo = secondaryInfo;
    _inst._elevatedButtonStyle = elevatedButtonStyle;
    _inst._outlinedButtonStyle = outlinedButtonStyle;
    _inst._inputDecorationTheme = inputDecorationTheme;
    _inst._googleFont = googleFont;

    _inst._colorGenerator = ColorGenerator();
    var colorResult = _inst._colorGenerator.computeColors(
      color: primaryColor ?? Colors.blue,
      algorithm: ColorGeneratorAlgorithm.values[colorEngine.index],
    );
    _inst._primary = colorResult.primary;
    _inst._secondary = colorResult.secondary;
    _inst._grey = colorResult.grey;

    return _inst;
  }

  late Brightness _brightness;
  late BackgroundResover? _backgroundColor;
  late GoogleFontsResover? _googleFont;
  late String? _fontFamily;
  late ThemeXColorEngine _colorEngine;
  late ColorGenerator _colorGenerator;
  late MaterialColor _primary;
  late MaterialColor _secondary;
  late MaterialColor _grey;

  late TextStyle? _bodyLarge;
  late TextStyle? _bodyMedium;
  late TextStyle? _buttonLarge;
  late TextStyle? _buttonMedium;
  late TextStyle? _subtitleLarge;
  late TextStyle? _subtitleMedium;
  late TextStyle? _caption;
  late TextStyle? _h1;
  late TextStyle? _h2;
  late TextStyle? _h3;
  late TextStyle? _h4;
  late TextStyle? _h5;
  late Color? _success;
  late Color? _danger;
  late Color? _warning;
  late Color? _info;
  late Color? _secondarySuccess;
  late Color? _secondaryDanger;
  late Color? _secondaryWarning;
  late Color? _secondaryInfo;
  late ButtonStyle? _elevatedButtonStyle;
  late ButtonStyle? _outlinedButtonStyle;
  late InputDecorationTheme? _inputDecorationTheme;

  @override
  ThemeData get() => ThemeData(
        typography: Typography(),
        scaffoldBackgroundColor:
            _backgroundColor?.call(primary, secondary, grey),
        brightness: _brightness,
        fontFamily: _fontFamily,
        primarySwatch: primary,
        backgroundColor: _backgroundColor?.call(primary, secondary, grey),
        textTheme: _googleFont != null ? _googleFont!(_textTheme) : _textTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: elevatedButtonStyle,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: outlinedButtonStyle,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: primary,
          disabledColor: primary,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: primary,
            brightness: _brightness,
            accentColor: secondary,
          ).copyWith(onSurface: primary[200]),
        ),
        inputDecorationTheme: inputDecorationTheme,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: primary,
          brightness: _brightness,
          accentColor: secondary,
        ),
      );

  TextTheme get _textTheme => TextTheme(
        caption: caption,
        bodyText1: bodyLarge,
        bodyText2: bodyMedium,
        button: buttonLarge,
        subtitle1: subtitleLarge,
        subtitle2: subtitleMedium,
        headline1: h1,
        headline2: h2,
        headline3: h3,
        headline4: h4,
        headline5: h5,
      );

  @override
  TextStyle get bodyLarge => _bodyLarge ?? const TextStyle(fontSize: 16);

  @override
  TextStyle get bodyMedium => _bodyMedium ?? const TextStyle(fontSize: 14);

  @override
  TextStyle get buttonLarge =>
      _buttonLarge ??
      const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get buttonMedium =>
      _buttonMedium ??
      const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get subtitleLarge =>
      _subtitleLarge ??
      const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      );

  @override
  TextStyle get subtitleMedium =>
      _subtitleMedium ??
      const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get caption =>
      _caption ??
      const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      );

  @override
  TextStyle get h1 =>
      _h1 ??
      const TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.normal,
      );

  @override
  TextStyle get h2 =>
      _h2 ??
      const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.normal,
      );

  @override
  TextStyle get h3 =>
      _h3 ??
      const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.normal,
      );

  @override
  TextStyle get h4 =>
      _h4 ??
      const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.normal,
      );

  @override
  TextStyle get h5 =>
      _h5 ??
      const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
      );

  @override
  MaterialColor get grey => _grey;

  @override
  MaterialColor get primary => _primary;

  @override
  MaterialColor get secondary => _secondary;

  @override
  Color get secondaryDanger => _secondaryDanger ?? const Color(0xFFFFF2F0);

  @override
  Color get secondaryInfo => _secondaryInfo ?? const Color(0xFFECF6FE);

  @override
  Color get secondarySuccess => _secondarySuccess ?? const Color(0xFFF2FCED);

  @override
  Color get secondaryWarning => _secondaryWarning ?? const Color(0xFFFEF9EC);

  @override
  Color get success => _success ?? const Color(0xFF51CF66);

  @override
  Color get warning => _warning ?? const Color(0xFFFFCA33);

  @override
  Color get info => _info ?? const Color(0xFF3FA9F5);

  @override
  Color get danger => _danger ?? const Color(0xFFFF4528);

  @override
  Color contrastColor(Color backgroundColor) {
    var isDark = ThemeData.estimateBrightnessForColor(backgroundColor) ==
        Brightness.dark;
/*    var isDark = backgroundColor.computeLuminance() > .69;*/
    return isDark ? Colors.white : Colors.black;
  }

  bool get primaryIsDark => TinyColor(primary).isDark();

  Color get inputFillColor => ThemeXColorEngine.traditional == _colorEngine
      ? TinyColor(grey[50]!).lighten(14).color
      : TinyColor(grey[50]!).lighten(3).color;

  InputDecorationTheme get inputDecorationTheme =>
      _inputDecorationTheme ??
      InputDecorationTheme(
        fillColor: inputFillColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primary[200]!, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: danger, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: primary[200]!, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: grey[300]!, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
      );

  ButtonStyle get elevatedButtonStyle =>
      _elevatedButtonStyle ??
      ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        primary: primary,
        onPrimary: contrastColor(primary),
        onSurface: primary,
        textStyle: buttonLarge.copyWith(color: Colors.amber),
      );

  ButtonStyle get outlinedButtonStyle =>
      _outlinedButtonStyle ??
      OutlinedButton.styleFrom(
        side: BorderSide(color: primary[400]!),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        onSurface: primary,
        textStyle: buttonLarge,
      );

  @override
  String toHex8(Color color) {
    return TinyColor(color).toHex8();
  }
}
