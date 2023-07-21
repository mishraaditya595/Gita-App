import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colour_constants.dart';
import '../../utils/hexcolor.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{
  String title;
  DefaultAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: HexColor(ColourConstants.fiord),
      title: Text(title, style: TextStyle(color: HexColor(ColourConstants.backgroundWhite)),),
      // Text("Chapter ${widget.chapterNumber}", style: TextStyle(color: HexColor(ColourConstants.backgroundWhite)),),
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: HexColor(ColourConstants.backgroundWhite))),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(45);
}
