
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbg/ui/widgets/verse_card_widget.dart';

class ChapterScreen extends StatefulWidget {

  final int chapterNumber;
  final String chapterName;

  const ChapterScreen({Key? key, required this.chapterNumber, required this.chapterName}) : super(key: key);


  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {

  int? chapterSummaryLines = 4;

  bool isNotExpanded = true;
  String expandSummaryText = "READ MORE";
  ScrollController? _controller;

  @override
  void initState() {
    setState(() {
      isNotExpanded = true;
      expandSummaryText = "READ MORE";
    });
    _controller = ScrollController();
    _controller?.addListener(scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chapter ${widget.chapterNumber}"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
        child: Column(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child:Text(widget.chapterName.toUpperCase(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),),
                    ),
                  ),
                const SizedBox(height: 20,),
                Visibility(
                  visible: isNotExpanded,
                  child: const Text(
                    "The eighth chapter of the Bhagavad Gita is Akshara Brahma Yoga. In this chapter, Krishna reveals the importance of the last thought before death. If we can remember Krishna at the time of death, we will certainly attain him. Thus, it is very important to be in constant awareness of the Lord at all times, thinking of Him and chanting His names at all times. By perfectly absorbing their mind in Him through constant devotion, one can go beyond this material existence to Lord's Supreme abode.",
                    softWrap: true,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Visibility(
                  visible: !isNotExpanded,
                  child: const Text(
                    "The eighth chapter of the Bhagavad Gita is Akshara Brahma Yoga. In this chapter, Krishna reveals the importance of the last thought before death. If we can remember Krishna at the time of death, we will certainly attain him. Thus, it is very important to be in constant awareness of the Lord at all times, thinking of Him and chanting His names at all times. By perfectly absorbing their mind in Him through constant devotion, one can go beyond this material existence to Lord's Supreme abode.",),
                ),
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                      onTap: () => inflateChapterSummary() ,
                      child: Text(expandSummaryText)
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Flexible(
              child: GestureDetector(

                child: ListView.builder(
                    controller: _controller,
                    itemCount: 20,
                    itemBuilder: (context, position){
                      return VerseCardWidget(
                        chapterNumber: widget.chapterNumber,
                        verseNumber: position + 1,
                      );
                    }),
              ),
            )
          ],
        ),
      ) ,
    );
  }

  inflateChapterSummary() {
    setState((){
      if(isNotExpanded) {
        isNotExpanded = false;
        expandSummaryText = "SHOW LESS";
      } else {
        isNotExpanded = true;
        expandSummaryText = "READ MORE";
      }
    });
  }

  scrollListener() {
    setState(() {
      isNotExpanded = true;
      expandSummaryText = "READ MORE";
    });
  }
}
