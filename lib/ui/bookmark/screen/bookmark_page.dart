import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbg/models/chapter_detailed_model.dart';
import 'package:sbg/models/verse_bookmark_model.dart';
import 'package:sbg/ui/bookmark/provider/bookmark_provider.dart';
import 'package:sbg/ui/widgets/default_app_bar.dart';
import 'package:sbg/ui/widgets/verse_card_widget.dart';
import 'package:sbg/utils/colour_constants.dart';
import 'package:sbg/utils/hexcolor.dart';

class BookmarkPage extends StatefulWidget {
  static const String routeName = "/bookmark_page";
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {

  @override
  Widget build(BuildContext context) {
      return ChangeNotifierProvider<BookmarkProvider>(
        create: (context) => BookmarkProvider(),
        child: Consumer<BookmarkProvider>(
        builder: (context, provider, child) {
          // provider.fetchAllBookmarks();
          return FutureBuilder(
            future: provider.fetchAllBookmarks(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.connectionState == ConnectionState.done) {
                return Scaffold(
                  appBar: DefaultAppBar(title: "Bookmarks Page"),
                  body: Padding(
                    padding:
                    const EdgeInsets.only(
                        top: 15, left: 15, right: 15, bottom: 0),
                    child: Column(
                      children: [
                        provider.verseBookmarkModelList.isEmpty
                            ? Column(
                          children: [
                            Center(
                              child: Text(
                                "No bookmarks found.",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyLarge,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Add a verse to bookmarks to find them here.",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium,
                              textAlign: TextAlign.center,
                            )
                          ],
                        )
                            : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                              itemCount: provider.bookmarksMap.keys.length,
                              itemBuilder: (context, position) {
                                return Column(
                                  children: [
                                    Container(
                                      width: double.maxFinite,
                                      alignment: Alignment.center,
                                      child: Text(
                                          "${provider.bookmarksMap.keys.elementAt(position)}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: HexColor(ColourConstants.primaryDarker)
                                        ),
                                      ),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                        itemCount: provider.bookmarksMap[provider.bookmarksMap.keys.elementAt(position)]?.length ?? 0,
                                        itemBuilder: (context, index){
                                          VerseBookmarkModel verseBookmarkModel = provider.bookmarksMap[provider.bookmarksMap.keys.elementAt(position)]![index];
                                          ChapterDetailedModel verseDetails = ChapterDetailedModel(
                                              verseNumber: verseBookmarkModel.verseNumber,
                                              chapterNumber: verseBookmarkModel.chapterNumber,
                                              text: verseBookmarkModel.text,
                                              transliteration: verseBookmarkModel.transliteration,
                                              wordMeanings: verseBookmarkModel.wordMeanings,
                                              translation: verseBookmarkModel.translation,
                                              commentary: verseBookmarkModel.commentary,
                                              verseNumberInt: verseBookmarkModel.verseNumberInt,
                                              bookHashName: verseBookmarkModel.bookHashName
                                          );
                                          return VerseCardWidget(verseDetails: verseDetails);
                                    })
                                  ],
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        }
      ));
    }
}
