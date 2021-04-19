import 'package:mvvmtemplate/core/init/theme/light/padding_insets.dart';
import 'package:mvvmtemplate/core/init/theme/light/text_theme_light.dart';

import 'light/color_sheme_light.dart';

abstract class ILightTheme {
  TextThemeLight textThemeLight = TextThemeLight.instance;
  ColorSchemeLight colorSchemeLight = ColorSchemeLight.instance;
  PaddingInsets paddingInsets = PaddingInsets.instance;
}
