import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sbg/ui/settings/provider/settings_screen_provider.dart';

import '../../widgets/default_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = "/settings_screen";
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool toggleValue = false;
  List<String> voiceList = ["Male", "Female"];
  String dropdownValue = "Male";

  @override
  void initState() {
    // initialiseProviderValues();
    super.initState();
  }
  initialiseProviderValues() async {
    SettingsScreenProvider provider = Provider.of<SettingsScreenProvider>(context, listen: false);
    await provider.checkForInitialValues();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsScreenProvider>(
        create: (context) => SettingsScreenProvider(),
        child: Consumer<SettingsScreenProvider>(
            builder: (context, provider, child) {
          return  FutureBuilder(
              future: provider.checkForInitialValues(),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    if(snapshot.connectionState == ConnectionState.done) {
      return Scaffold(
        appBar: DefaultAppBar(title: "Settings"),
        body: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
          child: Column(
            children: [
              Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Enable voice narration"),
                    Switch(
                      activeColor: Colors.amber,
                      activeTrackColor: Colors.cyan,
                      inactiveThumbColor: Colors.blueGrey.shade600,
                      inactiveTrackColor: Colors.grey.shade400,
                      value: provider.speakerToggleValue,
                      // changes the state of the switch
                      onChanged: (value) =>
                          provider.setNarrationToggleValue(value),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Select voice"),
                    SizedBox(
                      width: 180,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Choose your voice",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2),
                          ),
                        ),
                        value: dropdownValue,
                        enableFeedback: true,
                        items: voiceList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        }).toList(),
                        // Step 5.
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return const Scaffold(body: CircularProgressIndicator());
    }
    });



        }));
  }
}
