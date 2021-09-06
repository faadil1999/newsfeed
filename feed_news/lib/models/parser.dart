import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart';
import 'dart:async';

class Parser {

    final url = "https://www.france24.com/fr/rss";
    Future chargeRSS() async {
      final reponse  = await get(url);
      if(reponse.statusCode == 200){
          final feed = RssFeed.parse(reponse.body);
          return feed;
      }else{
        return ("erreur: ${reponse.statusCode}");
      }

    }

}