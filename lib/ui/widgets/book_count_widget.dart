import 'package:flutter/widgets.dart';

import '../../utils/hexcolor.dart';

class BookCountWidget extends StatelessWidget {
  int bookCount;
  BookCountWidget({Key? key, required this.bookCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            color: HexColor("#e0e0e0"),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text("$bookCount books"),
            )));
  }
}
