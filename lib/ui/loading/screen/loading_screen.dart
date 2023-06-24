import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:loading_progress_indicator/loading_progress_indicator.dart';
import 'package:loading_progress_indicator/progress_indicator/ball_spin_fade_loader_progress_indicator.dart';
import 'package:sbg/ui/loading/service/loading_service.dart';

import '../../bottombar/screen/bottom_bar.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState()  {
    loadAll();
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingProgressIndicator(
              indicator: BallSpinFadeLoaderProgressIndicator(),
              size: 70,
              color: Colors.orangeAccent,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.all(15.0),
              child: const Text(
                  "Please wait while we fetch the divine knowledge for you.\n\nहरि ओम तत् सत् |",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  Future<void> loadAll() async {
    LoadingService loadingService = GetIt.instance.get<LoadingService>();

    bool loadingStatus = await loadingService.fetchAllLoaders();


    if (loadingStatus) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const BottomBar(title: "")
      ));
    }
  }
}
