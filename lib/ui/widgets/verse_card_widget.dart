import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbg/ui/screens/verse_screen.dart';

class VerseCardWidget extends StatefulWidget {

  final int chapterNumber;
  final int verseNumber;

  const VerseCardWidget({Key? key, required this.chapterNumber, required this.verseNumber}) : super(key: key);

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
        onTap: () => onCardTapped(widget.chapterNumber, widget.verseNumber),
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
                  const SizedBox(width: 15,),
                  Text("Verse ${widget.chapterNumber}.${widget.verseNumber}", style: const TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              // const SizedBox(height: 10,),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "1.7. Know also, O best among the twice-born! the names of thosewho are the most distinguished amongst ourselves, the leaders of my army;these I name to thee for thy information."
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  onCardTapped(int chapterNumber, int verseNumber) {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
        VerseScreen(
          chapterNumber: chapterNumber,
          verseNumber: verseNumber ,
        )));
    log("Card $verseNumber tapped");
  }
}
