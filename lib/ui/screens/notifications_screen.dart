import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/notification_card_widget.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
            },
        icon: const Icon(Icons.arrow_back_ios_new)
        ) ,
        title: Text("Notifications"),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, position){
            return(
                NotificationCardWidget()
            );
      }),
    );
  }
}
