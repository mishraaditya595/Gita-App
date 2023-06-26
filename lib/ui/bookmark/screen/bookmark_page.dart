import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbg/models/chapter_detailed_model.dart';
import 'package:sbg/ui/bookmark/provider/bookmark_provider.dart';
import 'package:sbg/ui/widgets/verse_card_widget.dart';
import 'package:sbg/utils/colour_constants.dart';
import 'package:sbg/utils/hexcolor.dart';

class BookmarkPage extends StatefulWidget {
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
                  body: Padding(
                    padding:
                    const EdgeInsets.only(
                        top: 15, left: 15, right: 15, bottom: 0),
                    child: Column(
                      children: [
                         Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Text(
                              "My Bookmarks",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor(ColourConstants.primaryDarker)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
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
                              itemCount: provider.verseBookmarkModelList.length,
                              itemBuilder: (context, position) {
                                return Dismissible(
                                  key: UniqueKey(),
                                  child: VerseCardWidget(
                                      verseDetails: ChapterDetailedModel(
                                          verseNumber: provider
                                              .verseBookmarkModelList[position]
                                              .verseNumber,
                                          chapterNumber: provider
                                              .verseBookmarkModelList[position]
                                              .chapterNumber,
                                          text: provider
                                              .verseBookmarkModelList[position]
                                              .text,
                                          transliteration:
                                          provider
                                              .verseBookmarkModelList[position]
                                              .transliteration,
                                          wordMeanings: provider
                                              .verseBookmarkModelList[position]
                                              .wordMeanings,
                                          translation: provider
                                              .verseBookmarkModelList[position]
                                              .translation,
                                          commentary:
                                          provider
                                              .verseBookmarkModelList[position]
                                              .commentary,
                                          verseNumberInt: provider
                                              .verseBookmarkModelList[position]
                                              .verseNumberInt)),
                                  onDismissed: (_) {
                                    provider.removeBookmark(
                                        provider
                                            .verseBookmarkModelList[position]
                                            .verseNumber,
                                        provider
                                            .verseBookmarkModelList[position]
                                            .chapterNumber);
                                  },
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
