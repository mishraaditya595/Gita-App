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
    double height = MediaQuery.of(context).size.height * 0.09;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          Container(
            height: height,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: height,
                  decoration: const BoxDecoration(
                      // borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                    image: AssetImage("assets/images/krishna.jpg"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.72,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0, bottom: 5),
                        child: Text(
                          "Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 ",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.72,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: Text(
                          "Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 Long text 1 ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.2,
              ),
              child: const Divider(
                color: Colors.orangeAccent,
                thickness: 1,
              ))
        ],
      ),
    );
  }
}
