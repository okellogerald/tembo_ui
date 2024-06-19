import 'dart:ui';

import 'default.dart';

class TemboColorScheme {
  final Color primary,
      onPrimary,
      primaryContainer,
      onPrimaryContainer,
      secondary,
      onSecondary,
      secondaryContainer,
      onSecondaryContainer,
      border,
      background,
      onBackground,
      surface,
      onSurface,
      surfaceContainer,
      onSurfaceContainer,
      success,
      onSuccess,
      error,
      onError;

  const TemboColorScheme({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.border,
    required this.background,
    required this.onBackground,
    required this.surfaceContainer,
    required this.onSurfaceContainer,
    required this.error,
    required this.onError,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.surface,
    required this.onSurface,
    required this.success,
    required this.onSuccess,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
  });

  const TemboColorScheme.light({
    this.primary = TemboColors.primary,
    this.onPrimary = TemboColors.onPrimary,
    this.primaryContainer = TemboColors.primaryContainer,
    this.onPrimaryContainer = TemboColors.onPrimaryContainer,
    this.secondaryContainer = TemboColors.primaryContainer,
    this.onSecondaryContainer = TemboColors.onPrimaryContainer,
    this.secondary = TemboColors.secondary,
    this.onSecondary = TemboColors.onSecondary,
    this.border = TemboColors.border,
    this.background = TemboColors.background,
    this.onBackground = TemboColors.onBackground,
    this.surfaceContainer = TemboColors.surfaceContainer,
    this.onSurfaceContainer = TemboColors.onSurfaceContainer,
    this.error = TemboColors.error,
    this.onError = TemboColors.onError,
    this.surface = TemboColors.surface,
    this.onSurface = TemboColors.onSurface,
    this.success = TemboColors.success,
    this.onSuccess = TemboColors.onSuccess,
  });

  const TemboColorScheme.dark({
    this.primary = DarkTemboColors.primary,
    this.onPrimary = DarkTemboColors.onPrimary,
    this.primaryContainer = DarkTemboColors.primaryContainer,
    this.onPrimaryContainer = DarkTemboColors.onPrimaryContainer,
    this.secondaryContainer = DarkTemboColors.primaryContainer,
    this.onSecondaryContainer = DarkTemboColors.onPrimaryContainer,
    this.secondary = DarkTemboColors.secondary,
    this.onSecondary = DarkTemboColors.onSecondary,
    this.border = DarkTemboColors.border,
    this.background = DarkTemboColors.background,
    this.onBackground = DarkTemboColors.onBackground,
    this.surfaceContainer = DarkTemboColors.surfaceContainer,
    this.onSurfaceContainer = DarkTemboColors.onSurfaceContainer,
    this.error = DarkTemboColors.error,
    this.onError = DarkTemboColors.onError,
    this.surface = DarkTemboColors.surface,
    this.onSurface = DarkTemboColors.onSurface,
    this.success = DarkTemboColors.success,
    this.onSuccess = DarkTemboColors.onSuccess,
  });

  @override
  String toString() {
    return 'TemboColorScheme(primary: $primary, onPrimary: $onPrimary, primaryContainer: $primaryContainer, onPrimaryContainer: $onPrimaryContainer, secondary: $secondary  , onSecondary: $onSecondary, secondaryContainer: $secondaryContainer, onSecondaryContainer: $onSecondaryContainer , border: $border, background: $background, onBackground: $onBackground, surfaceContainer: $surfaceContainer, onSurfaceContainer: $onSurfaceContainer, error: $error, onError: $onError, border: $border)';
  }
}
