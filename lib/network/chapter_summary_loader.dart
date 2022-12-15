import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../utils/constants.dart';

class ChapterSummaryLoader {

  final String tableName = "chapter_summary";

  getDataFromDB() async {

    http.Response res = await http.get(
        Uri.parse('${Constants.URI}rest/v1/$tableName?select=*'),
        headers: {
          'Authorization': Constants.AUTHORIZATION,
          'apikey': Constants.API_KEY
        });

    var jsonResp = jsonDecode(res.body);
    // var response = jsonResp[0]['new_change'].toString();
    log("${jsonResp}");
  }
}