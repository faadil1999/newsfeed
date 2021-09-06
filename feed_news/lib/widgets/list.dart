import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apppractiq/widgets/test_faadil.dart';
import 'package:webfeed/webfeed.dart';
import 'test_faadil.dart';
import 'package:flutter_apppractiq/models/date_convertisseur.dart';
import 'page_detail.dart';


class Liste extends StatefulWidget {
  RssFeed feed;

  Liste(RssFeed feed) {
    this.feed = feed;
  }

  @override
  _ListeState createState() => new _ListeState();

}

class _ListeState extends State<Liste> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final taille = MediaQuery.of(context).size.width / 2.5;

    return new ListView.builder(
        itemCount: widget.feed.items.length,
        itemBuilder: (context, i) {
          RssItem item = widget.feed.items[i];
          print(item.pubDate);

          return new Container(
            child: new Card(
                elevation: 10.0,
                child: new InkWell(
                   onTap: (){
                     Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                       return new PageDetail(item);
                     })
                     );
                    },
                    child: new Column(
                      children: [
                          new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                            new TexteFaadil("Faadil"),
                             new TexteFaadil(new DateConvertisseur().convertirDate(item.pubDate.toString()), color: Colors.red,)
                           ],
                    ),
                     padding(),
                     new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                        new Card(
                      elevation: 7.5,
                         child: new Container(
                         width: taille,
                           child: new Image.network(item.enclosure.url , fit:BoxFit.fill),
                         ),
          ),
                      padding(),
                      new Container(
                      width: taille,
                        child: new TexteFaadil(item.title),
                        )

                      ],
                     ),
                    padding(),
                    ],
                  ),
                ),
            ),
              padding: EdgeInsets.only(right: 7.5 , left: 10.0),
          );
        });


  }
  Padding padding(){
      return new Padding(padding: EdgeInsets.only(top: 20.0));
  }
}