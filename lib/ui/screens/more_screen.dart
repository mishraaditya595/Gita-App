import 'package:flutter/material.dart';
import 'package:sbg/ui/widgets/story_card_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../../models/chapter_detailed_model.dart';
import '../../models/stories_model.dart';
import '../../objectbox.dart';
import '../../objectbox.g.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {

  List<StoriesModel> storiesList = [];
  String blogTitle = "";
  String blogDescription = "";
  String blogLink = "";

  @override
  void initState() {
    getBlogDetails();
    getStories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      blogTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    blogDescription,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: storiesList.length,
                itemBuilder: (context, position) {
                  var formatter = DateFormat('dd-MM-yyyy');
                  DateTime dateTime = DateTime.parse(storiesList[position].pubDate);
                  String formattedDate = formatter.format(dateTime);
                  return StoryCardWidget(
                    address: '',
                    date: formattedDate,
                    desc: storiesList[position].title,
                    imgeAssetPath: storiesList[position].thumbnail,
                    content: storiesList[position].content,
                    title: storiesList[position].title,
                    author: storiesList[position].author,
                  );
            }),
          )
        ],
      ));
  }

  Future<void> getStories() async {
    Store store = await ObjectBox().getStore();
    Box<StoriesModel> storyModelBox = store.box<StoriesModel>();
    List<StoriesModel>? _storiesList = storyModelBox.getAll();

    setState(() {
      storiesList.addAll(_storiesList);
    });
    store.close();
  }

  Future<void> getBlogDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      blogTitle = preferences.getString("x-blog-title");
      blogDescription = preferences.getString("x-blog-description");
      blogLink = preferences.getString("x-blog-link");
    });
  }
}
