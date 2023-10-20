import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbg/ui/settings/screen/settings_screen.dart';

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
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: (value) => handlePopUpMenuTap(value, context),
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context) {
            return {"Settings"}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.settings),
                    ),
                    Text(choice),
                  ],
                ),
              );
            }).toList();
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(45);

  void handlePopUpMenuTap(String value, BuildContext context) {
    switch(value) {
      case "Settings":
        Navigator.of(context).pushNamed(SettingsScreen.routeName);
        break;
      default:
        debugPrint("default");
    }
  }
}
