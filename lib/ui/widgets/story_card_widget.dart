import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbg/ui/screens/story_screen.dart';

class StoryCardWidget extends StatefulWidget {
  String desc;
  String date;
  String address;
  String imgeAssetPath;
  String content;
  String title;

  /// later can be changed with imgUrl
  StoryCardWidget({
    super.key,
    required this.address,
    required this.date,
    required this.imgeAssetPath,
    required this.desc,
    required this.content,
    required this.title,
  });

  @override
  State<StoryCardWidget> createState() => _StoryCardWidgetState();
}

class _StoryCardWidgetState extends State<StoryCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          // color: Color(0xff29404E),
          borderRadius: BorderRadius.circular(8)),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () => onStoryCardTapped(),
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  width: MediaQuery.of(context).size.width - 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.desc,
                        style: const TextStyle(
                            // color: Colors.white,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text("12 Jan, 2022"),
                    ],
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              child: Image.network(
                widget.imgeAssetPath,
                height: 100,
                width: 120,
                fit: BoxFit.fitWidth,
              ),
            )
            // Image.asset(imgeAssetPath, height: 100,width: 120, fit: BoxFit.cover,)),
          ],
        ),
      ),
    );
  }
  onStoryCardTapped() {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
        StoryScreen(
          story: widget.content, title: widget.title,
        )
        ));
    log("Story Card Tapped");
  }
}
