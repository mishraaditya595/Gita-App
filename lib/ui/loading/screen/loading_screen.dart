import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_progress_indicator/loading_progress_indicator.dart';
import 'package:loading_progress_indicator/progress_indicator/ball_spin_fade_loader_progress_indicator.dart';
import 'package:sbg/services/performance/firebase_performance_service.dart';
import 'package:sbg/ui/libraryhome/screen/library_home_page.dart';
import 'package:sbg/ui/loading/service/loading_service.dart';
import 'package:sbg/utils/colour_constants.dart';
import 'package:sbg/utils/hexcolor.dart';

import '../../../services/remote_config_service.dart';
import '../../bottombar/screen/bottom_bar.dart';

class LoadingScreen extends StatefulWidget {
  static const String routeName = "/loading_screen";
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  Widget build(BuildContext context) {
    RemoteConfigService remoteConfigService = GetIt.instance.get<RemoteConfigService>();

    return FutureBuilder(
      future: remoteConfigService.init(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){

        if(snapshot.connectionState == ConnectionState.done) {
          if(!kIsWeb) {
            FirebasePerformanceService.logTrace("Initial Loader", () => loadAll());
          } else {
            loadAll();
          }
        }

        return Scaffold(
        backgroundColor: HexColor(ColourConstants.offWhite),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/bhagavad-gita.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LoadingProgressIndicator(
                    indicator: BallSpinFadeLoaderProgressIndicator(),
                    size: 70,
                    color: HexColor(ColourConstants.antiqueBrass),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Loading...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: HexColor(ColourConstants.fiord),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
        ),
      );

    });

  }

    Future<void> loadAll() async {
    LoadingService loadingService = GetIt.instance.get<LoadingService>();

    bool loadingStatus = await loadingService.fetchAllLoaders();

    if (loadingStatus) {
      await Navigator.of(context).pushReplacementNamed(LibraryHomePage.routeName);
    }
  }
}
