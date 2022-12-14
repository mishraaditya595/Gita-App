import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbg/ui/screens/chapter_screen.dart';

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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () => onCardTapped(widget.chapterNumber, widget.chapterName),
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
              IconButton(
                  onPressed: () {
                    onCardTapped(widget.chapterNumber, widget.chapterName);
                  },
                  icon: const Icon(Icons.navigate_next))
            ],
          ),
        ),
      ),
    );
  }

  onCardTapped(int chapterNumber, String chapterName) {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
        ChapterScreen(
          chapterNumber: chapterNumber,
          chapterName: chapterName,
        )));
    log("Card $chapterNumber tapped");
  }
}
