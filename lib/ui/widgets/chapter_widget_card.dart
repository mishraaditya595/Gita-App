import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChapterWidgetCard extends StatefulWidget {
  final int chapterNumber;
  final String chapterName;
  final int verseCount;
  final String chapterSummary;

  const ChapterWidgetCard({
    Key? key, 
    required this.chapterNumber, 
    required this.chapterName, 
    required this.verseCount, 
    required this.chapterSummary
  }) : super(key: key);

  @override
  State<ChapterWidgetCard> createState() => _ChapterWidgetCardState();
}

class _ChapterWidgetCardState extends State<ChapterWidgetCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                  color: Colors.orangeAccent.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("${widget.chapterNumber}"),
                  )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.chapterName, style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.list, color: Colors.grey.shade700,),
                      Text("${widget.verseCount} Verses", style: TextStyle(color: Colors.grey.shade700),)
                    ],
                  )
                ],
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(onPressed: () {}, icon: const Icon(Icons.navigate_next))
              )
            ],
          ),
        ),
      ),
    );
  }
}
