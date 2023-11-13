import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import '../tembo_ui.dart';

/// Exposes the most recent [TemboThemeData] instance
class ThemeDataWrapper extends StatelessWidget {
  final Widget Function(BuildContext context, TemboThemeData themeData) builder;
  const ThemeDataWrapper({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TemboThemeData>(
      valueListenable: themeManager,
      builder: (context, themeData, child) {
        final theme = themeData.themeMode.isLight ? _lightTheme : _darkTheme;
        return Theme(
          data: theme,
          child: Builder(
            builder: (context) {
              return builder(
                context,
                themeData,
              );
            }
          ),
        );
      },
    );
  }
}

final _lightTheme = _colorScheme.toTheme;
final _darkTheme = _darkColorScheme.toTheme;

final _colorScheme = FlexColorScheme.light(
  fontFamily: kFontFamily,
  primary: LightTemboColors.primary,
  onPrimary: LightTemboColors.onPrimary,
  error: LightTemboColors.error,
  onError: LightTemboColors.onError,
  background: LightTemboColors.background,
  scaffoldBackground: LightTemboColors.background,
  onBackground: Colors.black,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);

final _darkColorScheme = FlexColorScheme.dark(
  fontFamily: kFontFamily,
  primary: DarkTemboColors.primary,
  onPrimary: DarkTemboColors.onPrimary,
  error: DarkTemboColors.error,
  onError: DarkTemboColors.onError,
  background: DarkTemboColors.background,
  scaffoldBackground: DarkTemboColors.background,
  onBackground: Colors.black,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);
