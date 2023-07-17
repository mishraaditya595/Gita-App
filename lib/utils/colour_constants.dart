import 'package:flutter/cupertino.dart';

import 'hexcolor.dart';

class ColourConstants {
  static String primaryDarker = "#eb5e2a";//"#FD7D6F";
  static String fiord = "#384C6A";
  static String antiqueBrass = "#CA896F";
  static String cornFlowerBlue = "#739CF7";
  static String scampi = "#6864B1";
  static String offWhite = "#DEDEDE";
  static String backgroundWhite = "#f7f2f9";

  static LinearGradient homePageAppBarGradient = LinearGradient(
      colors: [
        HexColor(ColourConstants.fiord),
        HexColor(ColourConstants.backgroundWhite),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter
    // stops: const [0.5, 1.0],
  );
}