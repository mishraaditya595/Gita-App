import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbg/ui/widgets/chapter_widget_card.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 170,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 3,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
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
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("LAST READ", style: TextStyle(fontWeight: FontWeight.bold),),
                Text("Verse 1.11", style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 10,),
            const Text(
              "1.6. The strong Yodhamanyu and the brave Uttamaujas, the sonof Subhadra (Abhimanyu, the son of Subhadra and Arjuna), and the sons ofDraupadi, all of great chariots (great heroes).",
              style: TextStyle(color: Colors.black),
              overflow: TextOverflow.fade,
              maxLines: 4,
            ),
            const SizedBox(height: 10,),
            const Text("CONTINUE READING"),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("CHAPTERS", style: TextStyle(fontWeight: FontWeight.bold),),
                IconButton(onPressed: () {}, icon: const Icon(Icons.sort_sharp))
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 18,
                  itemBuilder: (context, position) {
                    return ChapterWidgetCard(
                      chapterNumber: position + 1,
                      chapterName: 'Karma Yoga',
                      verseCount: 43,
                      chapterSummary: 'The third chapter of the Bhagavad Gita is Karma Yoga or the Path of Selfless Service. Here Lord Krishna emphasizes the importance of karma in life. He reveals that it is important for every human being to engage in some sort of activity in this material world. Further, he describes the kinds of actions that lead to bondage and the kinds that lead to liberation. Those persons who continue to perform their respective duties externally for the pleasure of the Supreme, without attachment to its rewards get liberation at the end.',
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
