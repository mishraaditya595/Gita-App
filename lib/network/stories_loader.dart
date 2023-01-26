import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:objectbox/objectbox.dart';
import 'package:sbg/models/chapter_summary_model.dart';
import 'package:sbg/models/stories_model.dart';
import 'package:sbg/objectbox.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';


class StoriesLoader {

  getDataFromDB() async {

    http.Response res = await http.get(
        Uri.parse(Constants.MEDIUM_URI),
       );

    addDataToLocalDb(res);
  }

  Future<void> addDataToLocalDb(Response res) async {
    Store store = await ObjectBox().getStore();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<StoriesModel> storiesList = [];
    if(res.statusCode == 200) {
      var jsonResp = jsonDecode(res.body)['items'];
      for (int i = 0; i < jsonResp.length; i++) {
        var story = jsonResp[i];
        storiesList.add(toChapterSummaryModel(story));
      }
      store.box<StoriesModel>().removeAll();
      store.box<StoriesModel>().putMany(storiesList);
      jsonResp = jsonDecode(res.body)['feed'];
      var title = jsonResp['title'].split(' - ');
      var link = jsonResp['link'].split(' - ');
      var description = jsonResp['description'].split(' - ');

      await preferences.setString('x-blog-title', title[0]);
      await preferences.setString('x-blog-link', link[0]);
      await preferences.setString('x-blog-description', description[0]);
      
      log("Story Loaded: ${store.box<StoriesModel>().getAll().length}");
      store.close();
    }
  }

  StoriesModel toChapterSummaryModel(story) {
    StoriesModel storiesModel = StoriesModel(
        title: story['title'].toString().trim() ?? '',
        pubDate: story['pubDate'].toString().trim() ?? '',
        link: story['link'].toString().trim() ?? '',
        author: story['author'].toString().trim() ?? '',
        thumbnail: story['thumbnail'].toString().trim() ?? '',
        content: story['content'].toString().trim() ?? '',
    );
    return storiesModel;
  }
}