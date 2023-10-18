import 'dart:ui';

import 'package:flutter/foundation.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class TransparentHexColor extends Color {
  static int _getTransparentColorFromHex(String hexColor, OpacityValue opacity) {
    String opacityKey = opacityMap[opacity] ?? "";
    hexColor = "$opacityKey$hexColor";
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  TransparentHexColor(final String hexColor, final OpacityValue opacityValue) : super(_getTransparentColorFromHex(hexColor, opacityValue));
}

Map<OpacityValue, String> opacityMap = {
  OpacityValue.fullOpacity : "FF",
  OpacityValue.highOpacity : "BF",
  OpacityValue.midOpacity : "8C",
  OpacityValue.lowOpacity : "33",
  OpacityValue.zeroOpacity : "00"
};

enum OpacityValue{
  fullOpacity,
  highOpacity,
  midOpacity,
  lowOpacity,
  zeroOpacity
}

