import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'test_faadil.dart';
import 'package:flutter_apppractiq/models/date_convertisseur.dart';

class PageDetail extends StatelessWidget{
RssItem item;
  PageDetail(RssItem item){
    this.item = item;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Detail de l'article "),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new TexteFaadil(item.title , fontSize: 30.0, ),
            new Card(
              elevation: 7.5,
              child: new Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: new Image.network(item.enclosure.url , fit: BoxFit.fill,),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new TexteFaadil("Faadil"),
                new TexteFaadil(new DateConvertisseur().convertirDate(item.pubDate.toString())),
              ],
            ),
            new TexteFaadil(item.description)
          ],
        ),
      ),
    );
  }

}