// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/yts.dart';
import 'package:http/http.dart' as http;

class YtsApi {
  static Future<YtsData> getMovies() async {
    String baseUrl = 'https://yts.mx/api/v2/';
    String listMovies = 'list_movies.json';
    String minRating = 'minimum_rating=4';
    String rtRatings = 'with_rt_ratings=true';
    String sort = 'sort_by=year';
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

  static Future<bool> checkImage(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<YtsData> getTorrents() async {
    String url = LIST_MOVIES;
    final response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return YtsData.fromJson(data);
    }
    debugPrint('error: ${response.statusCode}');
    return YtsData();
  }

  static const String BASE_URL = "https://yts.mx/api/v2/";
  static const String LIST_MOVIES = "${BASE_URL}list_movies.json";
  static const String MOVIE_DETAILS = "${BASE_URL}movie_details.json";
  static const String MOVIE_SUGGESTIONS = "${BASE_URL}movie_suggestions.json";
  static const String LIST_MOVIES_URL =
      "${BASE_URL}list_movies.json?limit=20&page=1";
  static const String MOVIE_DETAILS_URL =
      "${BASE_URL}movie_details.json?movie_id=10";
  static const String MOVIE_SUGGESTIONS_URL =
      "${BASE_URL}movie_suggestions.json?movie_id=10";
  static const String MOVIE_DETAILS_URL_WITH_ID =
      "${BASE_URL}movie_details.json?movie_id=";
  static const String MOVIE_SUGGESTIONS_URL_WITH_ID =
      "${BASE_URL}movie_suggestions.json?movie_id=";
  static const String LIST_MOVIES_URL_WITH_PAGE =
      "${BASE_URL}list_movies.json?limit=20&page=";
  static const String LIST_MOVIES_URL_WITH_PAGE_AND_QUERY =
      "${BASE_URL}list_movies.json?limit=20&page=1&query_term=";
  static const String LIST_MOVIES_URL_WITH_PAGE_AND_GENRE =
      "${BASE_URL}list_movies.json?limit=20&page=1&genre=";

  static const String LIST_MOVIES_URL_WITH_PAGE_AND_RATING =
      "${BASE_URL}list_movies.json?limit=20&page=1&minimum_rating=";

  static const String LIST_MOVIES_URL_WITH_PAGE_AND_SORT_BY =
      "${BASE_URL}list_movies.json?limit=20&page=1&sort_by=";

  static const String LIST_MOVIES_URL_WITH_PAGE_AND_ORDER_BY =
      "${BASE_URL}list_movies.json?limit=20&page=1&order_by=";

  static const String LIST_MOVIES_URL_WITH_PAGE_AND_WITH_RATING =
      "${BASE_URL}list_movies.json?limit=20&page=1&with_rt_ratings=";

  static const String LIST_MOVIES_URL_WITH_PAGE_AND_WITH_RATING_AND_QUERY =
      "${BASE_URL}list_movies.json?limit=20&page=1&with_rt_ratings=&query_term=";

  static const String LIST_MOVIES_URL_WITH_PAGE_AND_WITH_RATING_AND_GENRE =
      "${BASE_URL}list_movies.json?limit=20&page=1&with_rt_ratings=&genre=";

  static const String LIST_MOVIES_URL_WITH_PAGE_AND_WITH_RATING_AND_SORT_BY =
      "${BASE_URL}list_movies.json?limit=20&page=1&with_rt_ratings=&sort_by=";

  static const String LIST_MOVIES_URL_WITH_PAGE_AND_WITH_RATING_AND_ORDER_BY =
      "${BASE_URL}list_movies.json?limit=20&page=1&with_rt_ratings=&order_by=";

  static const String
      LIST_MOVIES_URL_WITH_PAGE_AND_WITH_RATING_AND_WITH_RATING =
      "${BASE_URL}list_movies.json?limit=20&page=1&with_rt_ratings=&with_rt_ratings=";

  static const String
      LIST_MOVIES_URL_WITH_PAGE_AND_WITH_RATING_AND_WITH_RATING_AND_QUERY =
      "${BASE_URL}list_movies.json?limit=20&page=1&with_rt_ratings=&with_rt_ratings=&query_term=";

  static const String
      LIST_MOVIES_URL_WITH_PAGE_AND_WITH_RATING_AND_WITH_RATING_AND_GENRE =
      "${BASE_URL}list_movies.json?limit=20&page=1&with_rt_ratings=&with_rt_ratings=&genre=";
}
