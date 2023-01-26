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
  String author;

  /// later can be changed with imgUrl
  StoryCardWidget({
    super.key,
    required this.address,
    required this.date,
    required this.imgeAssetPath,
    required this.desc,
    required this.content,
    required this.title,
    required this.author,
  });

  @override
  State<StoryCardWidget> createState() => _StoryCardWidgetState();
}

class _StoryCardWidgetState extends State<StoryCardWidget> {

  double getContainerHeight(String title) {
    if(title.length > 60) {
      return 130;
    } else if (title.length > 30 && title.length < 59) {
      return 110;
    }
    return 100;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getContainerHeight(widget.desc),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8)),
      child: Card(
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
                      const SizedBox(height: 8,),
                      Text("By ${widget.author.toUpperCase()}", style: const TextStyle(fontSize: 12),),
                      const SizedBox(height: 8,),
                      Text(widget.date),
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
                height: getContainerHeight(widget.desc),
                width: 120,
                fit: BoxFit.fill,
              ),
            )
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
