import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          "Srimad Bhagwad Gita",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.sync),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.person))],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 170,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 3,
                // margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image:
                            AssetImage("assets/images/temp_radha_krishna.jpeg"),
                        fit: BoxFit.fill,
                        alignment: Alignment.topCenter,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text("VERSE OF THE DAY", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Expanded(
                          child: Text(
                            "1.6. The strong Yodhamanyu and the brave Uttamaujas, the sonof Subhadra (Abhimanyu, the son of Subhadra and Arjuna), and the sons ofDraupadi, all of great chariots (great heroes).",
                            style: TextStyle(color: Colors.white),
                            overflow: TextOverflow.fade,
                            // softWrap: true,
                            maxLines: 4,
                            // textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("READ MORE", style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                ),

              ),
            ),
          )
        ],
      ),
    );
  }
}
