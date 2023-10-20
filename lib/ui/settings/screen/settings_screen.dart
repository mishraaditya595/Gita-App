import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/default_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = "/settings_screen";
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool toggleValue = false;
  List<String> voiceList = ["Male", "Female"];
  String dropdownValue = "Male";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: "Settings"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Enable voice narration"),
                  Switch(
                    activeColor: Colors.amber,
                    activeTrackColor: Colors.cyan,
                    inactiveThumbColor: Colors.blueGrey.shade600,
                    inactiveTrackColor: Colors.grey.shade400,
                    value: toggleValue,
                    // changes the state of the switch
                    onChanged: (value) => setState(() => toggleValue = value),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
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
                          borderSide: const BorderSide(color: Colors.black,width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.black,width: 2),
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
  }
}
