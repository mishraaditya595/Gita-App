import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChapterScreen extends StatefulWidget {

  final int chapterNumber;
  final String chapterName;

  const ChapterScreen({Key? key, required this.chapterNumber, required this.chapterName}) : super(key: key);

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.chapterNumber}. ${widget.chapterName}"),
      ),
      body: Center(child: Text("Chapter Number ${widget.chapterNumber}"),) ,
    );
  }
}
