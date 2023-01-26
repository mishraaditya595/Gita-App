import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.notifications),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Hare Krishna"),
                  Text(
                      "Its time to sit down for meditation and align yourself in the divine bliss. This is the perfect opportunity to start practicing Krishna Consciousness",
                    maxLines: 4,
                  )
                ],
              ),
            ),
            Container(
              child: Text("4 hours ago"),
            )
          ],
        ),
      ),
    );
  }
}
