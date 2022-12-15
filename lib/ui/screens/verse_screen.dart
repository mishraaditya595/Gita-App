import 'package:flutter/cupertino.dart';

class VerseScreen extends StatefulWidget {

  final int chapterNumber;
  final int verseNumber;

  const VerseScreen({Key? key, required this.chapterNumber, required this.verseNumber}) : super(key: key);

  @override
  State<VerseScreen> createState() => _VerseScreenState();
}

class _VerseScreenState extends State<VerseScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("${widget.chapterNumber}.${widget.verseNumber}"),
    );
  }
}
