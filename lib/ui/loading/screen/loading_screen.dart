import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sbg/main.dart';
import 'package:sbg/ui/homepage/screen/home_page.dart';
import 'package:sbg/ui/loading/service/loading_service.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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
        child: CircularStepProgressIndicator(
          totalSteps: 100,
          currentStep: 74,
          stepSize: 10,
          selectedColor: Colors.greenAccent,
          unselectedColor: Colors.grey[200],
          padding: 0,
          width: 150,
          height: 150,
          selectedStepSize: 15,
          roundedCap: (_, __) => true,
        ),
      ),
    );
  }

  Future<void> loadAll() async {
    LoadingService loadingService = GetIt.instance.get<LoadingService>();

    bool loadingStatus = await loadingService.fetchAllLoaders();


    if (loadingStatus) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const MyHomePage(title: "")
      ));
    }
  }
}
