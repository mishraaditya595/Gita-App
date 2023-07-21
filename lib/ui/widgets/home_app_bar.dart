import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colour_constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace:  Container(
        decoration:
        BoxDecoration(gradient: ColourConstants.homePageAppBarGradient),
      ),
      // backgroundColor: HexColor(ColourConstants.backgroundWhite),
      title: SizedBox(
        height: AppBar().preferredSize.height * 0.9,
        child: Image.asset("assets/images/bhagavad-gita.png"),
      ),
      centerTitle: true,
      actions: const [],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(45);
}
