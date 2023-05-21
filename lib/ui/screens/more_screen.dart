import 'package:flutter/material.dart';
import 'package:sbg/ui/widgets/story_card_widget.dart';
import 'package:sbg/utils/global_variables.dart';

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

  @override
  void initState() {

    getStories();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
                "Stories of Krishna",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: storiesList.length,
                itemBuilder: (context, position) {
                  return StoryCardWidget(
                    address: '',
                    date: storiesList[position].pubDate,
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
    Store store = GlobalVariables.store ?? await ObjectBox().getStore();
    Box<StoriesModel> storyModelBox = store.box<StoriesModel>();
    // QueryBuilder<StoriesModel> queryBuilder = storyModelBox.query(
    //
    // )..order(StoriesModel_.pubDate);
    // Query<StoriesModel> query = queryBuilder.build();
    // List<StoriesModel>? _storiesList = query.find();
    List<StoriesModel>? _storiesList = storyModelBox.getAll();

    setState(() {
      storiesList.addAll(_storiesList);
    });
    // store.close();
  }
}
