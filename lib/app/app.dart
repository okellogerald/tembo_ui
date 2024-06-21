import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/constants/themes/dau.dart';
import 'package:tembo_core/constants/themes/ride.dart';
import 'package:tembo_core/tembo_core.dart';

enum Project {
  temboPlus(
    "TemboPlus",
    primaryColor: DefaultTemboColors.primary,
    onPrimaryColor: DefaultTemboColors.onPrimary,
  ),
  dau(
    "Dau",
    primaryColor: DauColors.primary,
    onPrimaryColor: DauColors.onPrimary,
  ),
  lipaChina(
    "LipaChina",
    primaryColor: LipaChinaColors.primary,
    onPrimaryColor: LipaChinaColors.onPrimary,
  ),
  ride(
    "Ride",
    primaryColor: RideColors.primary,
    onPrimaryColor: RideColors.onPrimary,
  ),
  ;

  final String label;
  final Color primaryColor;
  final Color onPrimaryColor;

  const Project(
    this.label, {
    required this.primaryColor,
    required this.onPrimaryColor,
  });
}

Future<void> registerApp(Project project) async {
  await UserPreferencesAPI.instance.put("app", project.name);
}

Project getProject() {
  return Project.values.firstWhere(
    (e) => e.name == UserPreferencesAPI.instance.get("app"),
    orElse: () => Project.temboPlus,
  );
}

/// Provide context if you want to turn all text-themes colors to black
ThemeData getTheme([BuildContext? context]) {
  var theme = getColorScheme().toTheme;
  if (context != null) {
    theme = theme.copyWith(
        textTheme: TextTheme(
      titleLarge: context.textTheme.titleLarge.black.defaultFF,
      titleMedium: context.textTheme.titleMedium.black.defaultFF,
      titleSmall: context.textTheme.titleSmall.black.defaultFF,
      displayLarge: context.textTheme.displayLarge.black.defaultFF,
      displayMedium: context.textTheme.displayMedium.black.defaultFF,
      displaySmall: context.textTheme.displaySmall.black.defaultFF,
      bodyMedium: context.textTheme.bodyMedium.black.defaultFF,
      bodyLarge: context.textTheme.bodyLarge.black.defaultFF,
      bodySmall: context.textTheme.bodySmall.black.defaultFF,
      headlineMedium: context.textTheme.headlineMedium.black.defaultFF,
      headlineLarge: context.textTheme.headlineLarge.black.defaultFF,
      headlineSmall: context.textTheme.headlineSmall.black.defaultFF,
    ));
  }

  return theme;
}

FlexColorScheme getColorScheme() {
  final project = getProject();
  switch (project) {
    case Project.lipaChina:
      return defaultLightFlexColorScheme;
    case Project.dau:
      return dauTemboLightFlexColorScheme;
    case Project.ride:
      return rideLightFlexColorScheme;
    default:
      return defaultLightFlexColorScheme;
  }
}

TemboColorScheme getTemboColorScheme() {
  final project = getProject();
  switch (project) {
    case Project.lipaChina:
      return defaultLightColorScheme;
    case Project.dau:
      return dauTemboAppLightScheme;
    case Project.ride:
      return rideLightColorScheme;
    default:
      return defaultLightColorScheme;
  }
}

class InitialApp extends StatelessWidget {
  final Project project;
  const InitialApp(this.project, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: kFontFamily),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: Builder(builder: (context) {
          return Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(color: project.primaryColor),
            alignment: Alignment.center,
            child: TemboText.bold(
              project.label.toUpperCase(),
              style: context.textTheme.displayLarge
                  .withColor(project.onPrimaryColor),
            ),
          );
        }),
      ),
    );
  }
}
