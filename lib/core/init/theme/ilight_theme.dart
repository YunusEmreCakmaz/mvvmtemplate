import 'light/color_sheme_light.dart';
import 'light/padding_insets.dart';
import 'light/text_theme_light.dart';

abstract class ILightTheme {
  TextThemeLight textThemeLight = TextThemeLight.instance;
  ColorSchemeLight colorSchemeLight = ColorSchemeLight.instance;
  PaddingInsets paddingInsets = PaddingInsets.instance;
}
