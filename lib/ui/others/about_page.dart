import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colour_constants.dart';
import '../../utils/hexcolor.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

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
      Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 10),
          child: Divider(
            color: HexColor(ColourConstants.primaryDarker),
          )),
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
      Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 10),
          child: Divider(
            color: HexColor(ColourConstants.primaryDarker),
          )),
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
              SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    "Translation",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              Text(
                "ekaṁ śāstraṁ devakī-putra-gītam: let there be one scripture only, one common scripture for the whole world – Bhagavad-gītā \n \nEko devo devakī-putra eva: let there be one God for the whole world – Shree Krishna. \n \nEko mantras tasya nāmāni: and one hymn, one mantra, one prayer – the chanting of His holy name. \n \nKarmāpy ekaṁ tasya devasya sevā: and let there be one work only – the service of the Supreme Personality of Godhead.",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
      Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 10),
          child: Divider(
            color: HexColor(ColourConstants.primaryDarker),
          )),
      Padding(
        padding: const EdgeInsets.all(25),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                "The Bhagavad Gita is not content with providing a lofty philosophical understanding; it also describes clear-cut techniques for implementing its spiritual precepts for everyday life. \n \nUnable to deal with the immediate problem at hand, Arjun approached Shree Krishna for a palliative to overcome the anguish he was experiencing. Shree Krishna did not just advise him on his immediate problem, but digressed to give a profound discourse on the philosophy of life. \n \n",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 10),
          child: Divider(
            color: HexColor(ColourConstants.primaryDarker),
          )),
      Padding(
        padding: const EdgeInsets.all(25),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                "Understanding a couple of things will make it easier to read this commentary. \n \nThe Gita begins as a dialogue between King Dhritarashtra and his minister Sanjay. Since Dhritarashtra was blind, he could not be personally present on the battlefield. Dhritarashtra initiates the conversation by asking Sanjay about the proceedings in the battlefield; he does not speak again in the Gita. He is answered by Sanjay, who relates the happenings. Sanjay was a disciple of Ved Vyas, and by the grace of his teacher, he possessed the mystic ability of distant vision. Thus he could see from afar all that transpired on the battle ground, and was giving Dhritarashtra a first-hand account of the events on the warfront. \n \nSecondly, there is a profusion of appellations, also known as epithets. For example, Shree Krishna is referred to by the names Hrishikesh, Keshav, Govind, Madhusudan, Achyut, etc. Similarly, Arjun is called Dhananjaya, Gudakesh, Kaunteya, Parantapa, etc. Often these names are deliberately chosen to convey a particular meaning or flavor to the conversation. Such emphasis has been explained in the commentary whenever necessary.",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 10),
          child: Divider(
            color: HexColor(ColourConstants.primaryDarker),
          )),
    ]));
  }
}
