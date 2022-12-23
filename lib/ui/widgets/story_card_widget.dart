import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoryCardWidget extends StatefulWidget {
  const StoryCardWidget({Key? key}) : super(key: key);

  @override
  State<StoryCardWidget> createState() => _StoryCardWidgetState();
}

class _StoryCardWidgetState extends State<StoryCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 70,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image:
                    AssetImage("assets/images/krishna.jpg"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  )),
            ),
            const Flexible(
                child:
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8, bottom: 5),
                  child: Text (
                      "Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left
                  ),
                )
            ),
          ],
        ),
        Divider(color: Colors.orangeAccent,)
      ],
    );
  }
}
