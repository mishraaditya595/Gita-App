import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:objectbox/objectbox.dart';
import 'package:provider/provider.dart';
import 'package:sbg/models/chapter_detailed_model.dart';
import 'package:sbg/ui/homepage/provider/home_page_provider.dart';
import 'package:sbg/ui/widgets/verse_card_widget.dart';
import 'package:sbg/utils/colour_constants.dart';

import '../../../objectbox.dart';
import '../../../objectbox.g.dart';
import '../../../services/db/database_service.dart';
import '../../../utils/hexcolor.dart';
import '../provider/chapter_screen_provider.dart';

class ChapterScreen extends StatefulWidget {
  final int chapterNumber;
  final String chapterName;
  final String chapterSummary;

  const ChapterScreen(
      {Key? key,
      required this.chapterNumber,
      required this.chapterName,
      required this.chapterSummary})
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
            provider.fetchAll(widget.chapterNumber);
          });
          return Scaffold(
            appBar: AppBar(
              backgroundColor: HexColor(ColourConstants.primaryColour),
              title: Text("Chapter ${widget.chapterNumber}"),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new)),
            ),
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
                      const SizedBox(
                        height: 30,
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
