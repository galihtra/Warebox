// Place fonts/warebox_icon.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: warebox_icon
//      fonts:
//       - asset: fonts/warebox_icon.ttf
import 'package:flutter/widgets.dart';

class WareboxIcon {
  WareboxIcon._();

  static const String _fontFamily = 'WareboxIcon';

  static const IconData gudangDingin =
      IconData(0xe904, fontFamily: _fontFamily);
  static const IconData gudangEccomerce =
      IconData(0xe905, fontFamily: _fontFamily);
  static const IconData gudangKhusus =
      IconData(0xe906, fontFamily: _fontFamily);
  static const IconData gudangUmum = IconData(0xe907, fontFamily: _fontFamily);
  static const IconData search = IconData(0xe903, fontFamily: _fontFamily);
  static const IconData icon = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData lock = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData email = IconData(0xe900, fontFamily: _fontFamily);
}
