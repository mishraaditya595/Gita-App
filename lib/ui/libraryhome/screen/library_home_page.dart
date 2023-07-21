import 'package:flutter/material.dart';
import 'package:sbg/utils/colour_constants.dart';
import 'package:sbg/utils/hexcolor.dart';

class LibraryHomePage extends StatefulWidget {
  const LibraryHomePage({Key? key}) : super(key: key);

  @override
  State<LibraryHomePage> createState() => _LibraryHomePageState();
}

class _LibraryHomePageState extends State<LibraryHomePage> {

  List booksList = [
    {
      "bookImage" : "https://wallpapers.com/images/hd/bhagavad-gita-galaxy-digital-art-ajjgdklmuaaqa5my.jpg",
      "bookTitle": "Sri Isopanishad"
    },
    {
      "bookImage" : "https://wallpapers.com/images/hd/bhagavad-gita-galaxy-digital-art-ajjgdklmuaaqa5my.jpg",
      "bookTitle": "Srimad Bhagwad Gita"
    },
    {
      "bookImage" : "https://wallpapers.com/images/hd/bhagavad-gita-galaxy-digital-art-ajjgdklmuaaqa5my.jpg",
      "bookTitle": "Updeshmrita"
    },
    {
      "bookImage" : "https://wallpapers.com/images/hd/bhagavad-gita-galaxy-digital-art-ajjgdklmuaaqa5my.jpg",
      "bookTitle": "Srimad Bhagwatam"
    },
    {
      "bookImage" : "https://wallpapers.com/images/hd/bhagavad-gita-galaxy-digital-art-ajjgdklmuaaqa5my.jpg",
      "bookTitle": "Keno Upanishad"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
               Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                        "The ultimate source of spiritual wisdom",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        color: HexColor(ColourConstants.fiord,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "A profound journey within oneself to seek and understand the essence of life, purpose, and existence.",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: HexColor(ColourConstants.fiord)
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(vertical: 10),
                color: HexColor(ColourConstants.scampi),
                width: MediaQuery.of(context).size.height,
                child: Center(
                  child: Text(
                    "Must Read Books",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      color: HexColor(ColourConstants.backgroundWhite)
                    ),
                  ),
                ),
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 195,
                ),
                physics: const ClampingScrollPhysics(),
                itemCount: booksList.length > 6 ? 6 : booksList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        child: Image.network(
                          booksList[index]["bookImage"],
                          height: 150,
                          width: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Align(
                          alignment : Alignment.center,
                          child: Text(
                            booksList[index]["bookTitle"],
                            style: TextStyle(
                                fontSize: 12
                            ),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  );
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: HexColor(ColourConstants.cornFlowerBlue),
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("View all books"),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "GitaVedanta is a free, online research tool dedicated to exploring the Vedic scriptures, offering profound insights into ancient wisdom and spiritual teachings. Discover the essence of ancient Vedic knowledge and embark on a transformative journey of self-discovery and enlightenment with GitaVedanta."
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
