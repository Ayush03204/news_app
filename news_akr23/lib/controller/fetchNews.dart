// https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=1814ff8eb9684e459ad2ec178b5b1181
import 'dart:convert';

import 'package:http/http.dart';
import 'dart:math';

import 'package:news_akr23/model/newsArt.dart';

class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
    "Hindustan Times",
    "Telangana Today",
    "Thehealthsite.com",
    "News-Medical.Net",
    "The Times of India",
    "WION",
    "Crictracker.com",
    "Transcontinentaltimes.com",
    "International Cricket Council",
    "Moneycontrol",
    "The Weather Channel",
    "Gadgets360.com",
    "SamMobile",
    "NDTV News",
    "GSMArena.com",
    "The Quint",
    "Firstpost",
    "Mid-day",
    "Ptinews.com",
    "ndtvnews.com",
    "abpnews.com",
  ];

  static Future<NewsArt> fetchNews() async {
    final _random = new Random();
    var sourceID = sourcesId[_random.nextInt(sourcesId.length)];

    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&categories=science,technology,health,entertainment,sports,business,education,politics,economics&apiKey=1814ff8eb9684e459ad2ec178b5b1181"));

    Map body_data = jsonDecode(response.body);
    List articles = body_data["articles"];

    final _Newrandom = new Random();
    var myArticle = articles[_Newrandom.nextInt(articles.length)];

    return NewsArt.fromAPItoApp(myArticle);
  }
}
