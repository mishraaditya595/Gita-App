import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/ui/chapter_detailed_model_ui.dart';
import '../verse/screen/verse_screen.dart';

class VerseCardWidget extends StatefulWidget {
  final ChapterDetailedModel verseDetails;

  const VerseCardWidget({
    Key? key,
    required this.verseDetails,
  }) : super(key: key);

  @override
  State<VerseCardWidget> createState() => _VerseCardWidgetState();
}

class _VerseCardWidgetState extends State<VerseCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () => onCardTapped(int.parse(widget.verseDetails.chapterNumber ?? "-1"),
            int.parse(widget.verseDetails.verseNumber ?? "-1" )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.book),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Verse ${widget.verseDetails.chapterNumber}.${widget.verseDetails.verseNumber}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // const SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.verseDetails.translation ?? ""),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  onCardTapped(int chapterNumber, int verseNumber) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VerseScreen(
                  chapterNumber: chapterNumber,
                  verseNumber: verseNumber,
                  verseDetails: widget.verseDetails,
                )));
    log("Card $verseNumber tapped");
  }
}
