import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45)),
            image: DecorationImage(
              image: AssetImage("assets/images/arjun-krishna.webp"),
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
            )),
        child: const Padding(
          padding: EdgeInsets.all(40.0),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "About Gita",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              )),
        ),
      ),
          // const SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.all(25),
             child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "A song of life, guiding you towards ultimate bliss.",
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
             ),
           ),
          Container(margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10),child: const Divider(color: Colors.orangeAccent,)),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Bhagavad-gītā is also known as Gītopaniṣad. It is the essence of Vedic knowledge and one of the most important Upaniṣads in Vedic literature. ",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          Container(margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10),child: const Divider(color: Colors.orangeAccent,)),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "ekaṁ śāstraṁ devakī-putra-gītam \neko devo devakī-putra eva \neko mantras tasya nāmāni yāni \n karmāpy ekaṁ tasya devasya sevā",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50, child: Center(child: Text("Translation", style: Theme.of(context).textTheme.titleLarge,),),),
                  Text(
                    "ekaṁ śāstraṁ devakī-putra-gītam: let there be one scripture only, one common scripture for the whole world – Bhagavad-gītā \n \nEko devo devakī-putra eva: let there be one God for the whole world – Śrī Kṛṣṇa. \n \nEko mantras tasya nāmāni: and one hymn, one mantra, one prayer – the chanting of His name. \n \nKarmāpy ekaṁ tasya devasya sevā: and let there be one work only – the service of the Supreme Personality of Godhead.",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          Container(margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10),child: const Divider(color: Colors.orangeAccent,)),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "The speaker of Bhagavad-gītā is Lord Śrī Kṛṣṇa. He is mentioned on every page of Bhagavad-gītā as the Supreme Personality of Godhead, Bhagavān. \n \nHere the Lord informs Arjuna that this system of yoga, the Bhagavad-gītā, was first spoken to the sun-god, and the sun-god explained it to Manu, and Manu explained it to Ikṣvāku, and in that way, by disciplic succession, one speaker after another, this yoga system has been coming down. But in the course of time it has become lost. Consequently the Lord has to speak it again, this time to Arjuna on the Battlefield of Kurukṣetra. \n \nBhagavad-gītā is instructed to Arjuna especially because Arjuna was a devotee of the Lord, a direct student of Kṛṣṇa, and His intimate friend. Therefore Bhagavad-gītā is best understood by a person who has qualities similar to Arjuna’s. \n \nAfter hearing Bhagavad-gītā from the Supreme Personality of Godhead, Arjuna accepted Kṛṣṇa as paraṁ brahma, the Supreme Brahman. Every living being is Brahman, but the supreme living being, or the Supreme Personality of Godhead, is the Supreme Brahman. Paraṁ dhāma means that He is the supreme rest or abode of everything; pavitram means that He is pure, untainted by material contamination; puruṣam means that He is the supreme enjoyer; śāśvatam, eternal; divyam, transcendental; ādi-devam, the original Supreme Personality of Godhead; ajam, the unborn; and vibhum, the greatest.",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          Container(margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10),child: const Divider(color: Colors.orangeAccent,)),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Being an associate of Lord Kṛṣṇa, Arjuna was above all ignorance, but Arjuna was put into ignorance on the Battlefield of Kurukṣetra just to question Lord Kṛṣṇa about the problems of life so that the Lord could explain them for the benefit of future generations of human beings and chalk out the plan of life. Then man could act accordingly and perfect the mission of human life.",
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          Container(margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10),child: const Divider(color: Colors.orangeAccent,)),
        ]));
  }
}
