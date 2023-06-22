
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:objectbox/objectbox.dart';
import 'package:sbg/models/chapter_detailed_model.dart';
import 'package:sbg/models/verse_bookmark_model.dart';
import 'package:sbg/ui/widgets/verse_card_widget.dart';

import '../../objectbox.g.dart';
import '../../services/db/database_service.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {

  List<VerseBookmarkModel> verseBookmarkModelList = [];

  @override
  void initState() {
    fetchAllBookmarks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(verseBookmarkModelList.isEmpty) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Text( "My Bookmarks",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 3,),
              Center(
                child: Text(
                  "No bookmarks found.",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                "Add a verse to bookmarks to find them here.",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 0),
          child: Column (
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text( "My Bookmarks",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Expanded(
                child: ListView.builder(
                    itemCount: verseBookmarkModelList.length,
                    itemBuilder: (context, position) {
                      return Dismissible(
                        key: UniqueKey(),
                        child: VerseCardWidget(
                            verseDetails: ChapterDetailedModel(
                                verseNumber: verseBookmarkModelList[position].verseNumber,
                                chapterNumber: verseBookmarkModelList[position].chapterNumber,
                                text: verseBookmarkModelList[position].text,
                                transliteration: verseBookmarkModelList[position].transliteration,
                                wordMeanings: verseBookmarkModelList[position].wordMeanings,
                                translation: verseBookmarkModelList[position].translation,
                                commentary: verseBookmarkModelList[position].commentary,
                                verseNumberInt: verseBookmarkModelList[position].verseNumberInt
                            )),
                        onDismissed: (_) {
                          removeBookmark(verseBookmarkModelList[position].verseNumber, verseBookmarkModelList[position].chapterNumber);
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      );
    }
  }

  Future<void> fetchAllBookmarks() async {
    DatabaseService databaseService = GetIt.instance.get<DatabaseService>();
    Store store = databaseService.getStore()!;
    Box<VerseBookmarkModel> chapterDetailedModelBox = store.box<
        VerseBookmarkModel>();
    List<VerseBookmarkModel>? _verseBookmarkModelList = chapterDetailedModelBox.getAll();

    setState(() {
      verseBookmarkModelList.addAll(_verseBookmarkModelList);
    });

  }

  Future<void> removeBookmark(String verseNumber, String chapterNumber) async {
    DatabaseService databaseService = GetIt.instance.get<DatabaseService>();
    Store store = databaseService.getStore()!;
    Box<VerseBookmarkModel> verseBookmarkModelBox = store.box<VerseBookmarkModel>();
    QueryBuilder<VerseBookmarkModel> queryBuilder = verseBookmarkModelBox.query(
        VerseBookmarkModel_.verseNumber.equals(verseNumber) &
        VerseBookmarkModel_.chapterNumber.equals(chapterNumber)
    );
    Query<VerseBookmarkModel> query = queryBuilder.build();
    List<VerseBookmarkModel>? bookmarkList = query.find();

    debugPrint("Bookmark to be removed: ${bookmarkList[0].id}");
    debugPrint("Bookmark length before removal: ${verseBookmarkModelBox.count()}");

    verseBookmarkModelBox.remove(bookmarkList[0].id);

    bookmarkList = verseBookmarkModelBox.getAll();
    debugPrint("Bookmark length after removal: ${verseBookmarkModelBox.count()}");


    setState(() {
      verseBookmarkModelList = bookmarkList!;
    });
  }
}
