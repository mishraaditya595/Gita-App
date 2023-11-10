import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:sbg/ui/bookmark/screen/bookmark_page.dart';
import 'package:sbg/ui/library/screen/library_page.dart';
import 'package:sbg/ui/libraryhome/provider/library_home_provider.dart';
import 'package:sbg/ui/libraryhome/services/library_services.dart';
import 'package:sbg/ui/widgets/book_card_widget.dart';
import 'package:sbg/ui/widgets/default_app_bar.dart';
import 'package:sbg/ui/widgets/home_app_bar.dart';
import 'package:sbg/utils/colour_constants.dart';
import 'package:sbg/utils/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/books_model.dart';
import '../../loading/service/loading_service.dart';
import '../../settings/screen/settings_screen.dart';

class LibraryHomePage extends StatefulWidget {
  static const String routeName = "/library_home";
  const LibraryHomePage({Key? key}) : super(key: key);

  @override
  State<LibraryHomePage> createState() => _LibraryHomePageState();
}

class _LibraryHomePageState extends State<LibraryHomePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? missedDeepLinkParam = prefs.getString("MISSED_DEEP_LINK");
      if(missedDeepLinkParam != null) {
        print("Missed Deep Link: $missedDeepLinkParam");
        prefs.remove("MISSED_DEEP_LINK");
        await Navigator.of(context).pushNamed(SettingsScreen.routeName);
      } else {
        print("missed deep link not null");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LibraryHomeProvider>(
        create: (context) => LibraryHomeProvider(),
        child:
        Consumer<LibraryHomeProvider>(builder: (context, provider, child) {
          return Scaffold(
            appBar: const HomeAppBar(),
            body: FutureBuilder(
              future: provider.getAll(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
              if(snapshot.connectionState == ConnectionState.done) {
                return LiquidPullToRefresh(
                  springAnimationDurationInMilliseconds: 300,
                  color: HexColor(ColourConstants.backgroundWhite),
                  backgroundColor: HexColor(ColourConstants.fiord),
                  showChildOpacityTransition: false,
                  onRefresh: () async {
                    LoadingService loadingService = GetIt.instance.get<LoadingService>();
                    await loadingService.load();
                    setState(() {});
                  },
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  "The ultimate source of spiritual wisdom",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: HexColor(
                                      ColourConstants.fiord,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "A profound journey within oneself to seek and understand the essence of life, purpose, and existence.",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor(ColourConstants.fiord)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            color: HexColor(ColourConstants.scampi),
                            width: MediaQuery.of(context).size.height,
                            child: Center(
                              child: Text(
                                "Must Read Books",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: HexColor(ColourConstants.backgroundWhite)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                provider.booksModelList.length < 3 ? provider.booksModelList.length : 3,
                                mainAxisExtent: 230,
                              ),
                              physics: const ClampingScrollPhysics(),
                              itemCount:
                              provider.booksModelList.length > 6 ? 6 : provider.booksModelList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return BookCardWidget(bookMap: provider.booksModelList[index]);
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () => Navigator.of(context).pushNamed(LibraryPage.routeName),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: HexColor(ColourConstants.cornFlowerBlue),
                                      borderRadius: BorderRadius.all(Radius.circular(8))),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("View all books"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                  "GitaVedanta is a free, online research tool dedicated to exploring the Vedic scriptures, offering profound insights into ancient wisdom and spiritual teachings. Discover the essence of ancient Vedic knowledge and embark on a transformative journey of self-discovery and enlightenment with GitaVedanta."),
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.of(context).pushNamed(BookmarkPage.routeName),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: HexColor(ColourConstants.cornFlowerBlue),
                                    borderRadius: BorderRadius.all(Radius.circular(8))),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Show Bookmarks",),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else{
                return CircularProgressIndicator();
              }
            }),
          );
        })
    );




  }
}
