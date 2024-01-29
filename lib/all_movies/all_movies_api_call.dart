import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/yts.dart';
import 'package:http/http.dart' as http;

class AllMoviesApiCall{
  static Future<YtsData> fetchAllMovies() async {
    String baseUrl = 'https://yts.mx/api/v2/';
    String listMovies = 'list_movies.json';
    String minRating = 'minimum_rating=5';
    String rtRatings = 'with_rt_ratings=true';
    // String sort = 'sort_by=year';
    String sort = 'sort_by=date_added';
    String order = 'order_by=desc';
    String limit = 'limit=50&page=1';

    String pagination = '$sort&$order&$minRating&$rtRatings&$limit';
    String url = '$baseUrl$listMovies?$pagination';
    final response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      debugPrint('got data successfully');
      return YtsData.fromJson(data);
    }
    debugPrint('error: ${response.statusCode}');
    return YtsData();
  }
}