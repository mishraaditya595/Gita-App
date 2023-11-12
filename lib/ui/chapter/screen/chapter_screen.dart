import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbg/models/books_model.dart';
import 'package:sbg/models/chapter_detailed_model.dart';
import 'package:sbg/ui/widgets/default_app_bar.dart';
import 'package:sbg/ui/widgets/verse_card_widget.dart';
import 'package:sbg/utils/colour_constants.dart';
import 'package:share_plus/share_plus.dart';

import '../../../utils/hexcolor.dart';
import '../provider/chapter_screen_provider.dart';

class ChapterScreen extends StatefulWidget {
  static const String routeName = "/chapter_screen";
  final int chapterNumber;
  final String chapterName;
  final String chapterSummary;
  final BooksModel booksModel;

  const ChapterScreen(
      {Key? key,
      required this.chapterNumber,
      required this.chapterName,
      required this.chapterSummary,
        required this.booksModel
      })
      : super(key: key);

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChapterScreenProvider>(
        create: (context) => ChapterScreenProvider(),
        child: Consumer<ChapterScreenProvider>(
            builder: (context, provider, child) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            provider.bookHashWord = widget.booksModel.bookHashWord;
            provider.fetchAll(widget.chapterNumber);
          });
          return Scaffold(
            appBar: DefaultAppBar(title: "Chapter ${widget.chapterNumber}"),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            widget.chapterName.toUpperCase(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: HexColor(ColourConstants.primaryDarker)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Visibility(
                        visible: provider.isNotExpanded,
                        child: Text(
                          widget.chapterSummary,
                          softWrap: true,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Visibility(
                        visible: !provider.isNotExpanded,
                        child: Text(
                          widget.chapterSummary,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                            onTap: () => provider.inflateChapterSummary(),
                            child: Text(provider.expandSummaryText)),
                      ),
                      Visibility(
                        visible: !kIsWeb,
                        child: ElevatedButton(
                            onPressed: () {
                              String deepLink = "gitavedanta.in/share/?book=${provider.bookHashWord}&verse=${widget.chapterNumber}.32xze";
                              String chapterSummary = widget.chapterSummary;
                              if(chapterSummary.length > 80) {
                              chapterSummary.substring(0, 79);
                              chapterSummary += " ...";
                              chapterSummary += "\n\n\nCheckout the chapter at $deepLink";
                              } else {
                              chapterSummary += "\n\n\nCheckout the chapter at $deepLink";
                              }
                              Share.share(chapterSummary);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: TransparentHexColor(ColourConstants.primaryDarker, OpacityValue.highOpacity),
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white
                              ),
                            ),
                            child: Container(
                              width: 160,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Icon(Icons.share, color: Colors.white,),
                                  ),
                                  Text("Share the chapter", style: TextStyle(color: Colors.white),),
                                ],
                              ),
                            )
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: provider.chapterDetailedList.length,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, position) {
                            return VerseCardWidget(
                              verseDetails: ChapterDetailedModel(
                                verseNumber: provider
                                    .chapterDetailedList[position].verseNumber,
                                chapterNumber: provider
                                    .chapterDetailedList[position]
                                    .chapterNumber,
                                text:
                                    provider.chapterDetailedList[position].text,
                                transliteration: provider
                                    .chapterDetailedList[position]
                                    .transliteration,
                                wordMeanings: provider
                                    .chapterDetailedList[position].wordMeanings,
                                translation: provider
                                    .chapterDetailedList[position].translation,
                                commentary: provider
                                    .chapterDetailedList[position].commentary,
                                verseNumberInt: provider
                                    .chapterDetailedList[position]
                                    .verseNumberInt,
                                bookHashName: provider.chapterDetailedList[position].bookHashName,
                              ),
                            );
                          })
                    ],
                  ),
                )
              ],
            ),
          );
        }));
  }
}
