import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerseScreen extends StatefulWidget {
  final int chapterNumber;
  final int verseNumber;

  const VerseScreen(
      {Key? key, required this.chapterNumber, required this.verseNumber})
      : super(key: key);

  @override
  State<VerseScreen> createState() => _VerseScreenState();
}

class _VerseScreenState extends State<VerseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verse ${widget.chapterNumber}.${widget.verseNumber}"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 15),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "धृतराष्ट्र उवाचधर्मक्षेत्रे कुरुक्षेत्रे समवेता युयुत्सवः।मामकाः पाण्डवाश्चैव किमकुर्वत सञ्जय।।1.1।।",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepOrange,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        color: Colors.orangeAccent,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "TRANSLITERATION",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "dhṛitarāśhtra uvāchadharma-kṣhetre kuru-kṣhetre samavetā yuyutsavaḥmāmakāḥ pāṇḍavāśhchaiva kimakurvata sañjaya",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Colors.orangeAccent,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "WORD MEANING",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "dhṛitarāśhtraḥ uvācha—Dhritarashtra said; dharma-kṣhetre—the land of dharma; kuru-kṣhetre—at Kurukshetra; samavetāḥ—having gathered; yuyutsavaḥ—desiring to fight; māmakāḥ—my sons; pāṇḍavāḥ—the sons of Pandu; cha—and; eva—certainly; kim—what; akurvata—did they do; sañjaya—Sanjay",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Colors.orangeAccent,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "TRANSLATION",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "1.1 Dhritarashtra said  What did my people and the sons of Pandu do when they had assembledtogether eager for battle on the holy plain of Kurukshetra, O Sanjaya.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Colors.orangeAccent,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "COMMENTARY",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "1.1 धर्मक्षेत्रे on the holy plain? कुरुक्षेत्रे in Kurukshetra? समवेताः assembled together? युयुत्सवः desirous to fight? मामकाः my people? पाण्डवाः the sons of Pandu? च and? एव also? किम् what? अकुर्वत did do? सञ्जय O Sanjaya. \n \n Commentary \n \n Dharmakshetra -- that place which protects Dharma is Dharmakshetra. Because it was in the land of the Kurus? it was called Kurukshetra.Sanjaya is one who has conered likes and dislikes and who is impartial.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
