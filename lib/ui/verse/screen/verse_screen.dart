import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sbg/services/text-to-speech/text_to_speech_service.dart';
import 'package:sbg/utils/colour_constants.dart';
import 'package:sbg/utils/hexcolor.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/chapter_detailed_model.dart';
import '../provider/verse_screen_provider.dart';

class VerseScreen extends StatefulWidget {
  static const String routeName = "/verse_screen";
  late int chapterNumber;
  late int verseNumber;
  late ChapterDetailedModel verseDetails;

  VerseScreen(
      {Key? key,
      required this.chapterNumber,
      required this.verseNumber,
      required this.verseDetails})
      : super(key: key);

  @override
  State<VerseScreen> createState() => _VerseScreenState();
}

class _VerseScreenState extends State<VerseScreen> {


  @override
  void initState() {
    // getLang();
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    TextToSpeechService textToSpeechService = GetIt.instance.get<TextToSpeechService>();
    textToSpeechService.stopSound();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    ScrollController listScrollController = ScrollController();
    return ChangeNotifierProvider<VerseScreenProvider>(
        create: (context) => VerseScreenProvider(),
        child: Consumer<VerseScreenProvider>(builder: (context, provider, child) {
          provider.setInitialValue(
              widget.verseDetails, widget.chapterNumber, widget.verseNumber);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: HexColor(ColourConstants.fiord),
              title: Text(
                  "Verse ${provider.verseDetails.chapterNumber}.${provider.verseDetails.verseNumber}", style: TextStyle(color: HexColor(ColourConstants.backgroundWhite)),),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  icon: Icon(Icons.arrow_back_ios_new, color: HexColor(ColourConstants.backgroundWhite))),
              actions: [
                IconButton(
                    onPressed: () {
                      var toastText = provider.fabIcon == Icons.bookmark_add
                          ? "Verse added to bookmarks."
                          : "Verse removed from bookmarks.";
                      showToast(toastText, context: context);

                      provider.addOrRemoveBookmarks(provider.verseDetails);
                    },
                    icon: Icon(provider.fabIcon, color: HexColor(ColourConstants.backgroundWhite)))
              ],
            ),
            body: ListView(controller: listScrollController, children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 25, right: 25, bottom: 45),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      provider.verseDetails.text ?? '',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: HexColor(ColourConstants.primaryDarker),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: !kIsWeb,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        String deepLink = "gitavedanta.in/share?book=${provider.verseDetails.bookHashName}&verse=${provider.chapterNumber}.${provider.verseNumber}";
                                        int length = provider.verseDetails.translation.length;
                                        String verseText = provider.verseDetails.translation;
                                        if(provider.verseDetails.translation.length > 140) {
                                          verseText.substring(0, 139);
                                          verseText += " ...";
                                          verseText += "\n\n\nFind the complete verse at $deepLink";
                                        } else {
                                          verseText += "\n\n\nCheckout the verse at $deepLink";
                                        }
                                        Share.share(verseText);
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
                                        width: 150,
                                        child: const Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                                              child: Icon(Icons.share, color: Colors.white,),
                                            ),
                                            Text("Share the verse", style: TextStyle(color: Colors.white),),
                                          ],
                                        ),
                                      )
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: HexColor(ColourConstants.primaryDarker),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "TRANSLITERATION",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              provider.verseDetails.transliteration ?? '',
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Divider(
                              color: HexColor(ColourConstants.primaryDarker),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "WORD MEANING",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              provider.verseDetails.wordMeanings ?? '',
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Divider(
                              color: HexColor(ColourConstants.primaryDarker),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "TRANSLATION",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              provider.verseDetails.translation ?? '',
                              textAlign: TextAlign.start,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400),
                            ),
                            Visibility(
                              visible: provider.isCommentaryAvailable,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Divider(
                                    color: Colors.orangeAccent,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    "COMMENTARY",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    provider.verseDetails.commentary ?? '',
                                    textAlign: TextAlign.start,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            bottomNavigationBar: Material(
              elevation: 10,
              child: Container(
                color: HexColor(ColourConstants.fiord),
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                        radius: 16,
                        backgroundColor: HexColor(ColourConstants.backgroundWhite),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            provider.navigateVerses("PREVIOUS");
                            if (listScrollController.hasClients) {
                              final position = listScrollController
                                  .position.minScrollExtent;
                              listScrollController.jumpTo(position);
                            }
                          },
                          icon: Icon(Icons.navigate_before),
                          color: HexColor(ColourConstants.fiord)
                        )),
                    CircleAvatar(
                        radius: 16,
                        backgroundColor: HexColor(ColourConstants.backgroundWhite),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            provider.navigateVerses("NEXT");
                            if (listScrollController.hasClients) {
                              final position = listScrollController
                                  .position.minScrollExtent;
                              listScrollController.jumpTo(position);
                            }
                          },
                          icon: Icon(Icons.navigate_next),
                          color: HexColor(ColourConstants.fiord),
                        )),
                  ],
                ),
              ),
            ),
            floatingActionButton: CircleAvatar(
              backgroundColor: TransparentHexColor(ColourConstants.fiord, OpacityValue.highOpacity),
              child: IconButton(
                icon: Icon(provider.speakerFlag ? Icons.volume_up : Icons.volume_off),
                color: Colors.white,
                onPressed: () {
                  provider.toggleSpeaker();
                  },
              ),
            ),
          );
        }));
  }

  Future<void> getLang() async {
    FlutterTts ttsObj = FlutterTts();
    var lang = await ttsObj.getLanguages;
    List<dynamic> voices = await ttsObj.getVoices;
    List<Map> v = [];
    for (var voice in voices) {
      if (voice['locale'] == 'en-IN') {
        v.add(voice);
        // Set the first matching voice and exit the loop
      }
    }
    debugPrint(v.toString());
  }
}
