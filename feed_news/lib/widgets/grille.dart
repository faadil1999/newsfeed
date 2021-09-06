import 'package:flutter/material.dart';
import 'test_faadil.dart';
import 'package:flutter_apppractiq/models/date_convertisseur.dart';
import 'package:webfeed/webfeed.dart';
import 'page_detail.dart';

class Grille extends StatefulWidget{

  RssFeed feed ;
  Grille(RssFeed feed){
      this.feed = feed ;
  }

  @override
  _GrilleState createState() => new _GrilleState();

}

class _GrilleState extends State<Grille>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GridView.builder(
      itemCount: widget.feed.items.length,
        gridDelegate:  new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context , i){
            RssItem  item = widget.feed.items[i];
            return new InkWell(
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                  return new PageDetail(item);
                })
                );
              },

              child:new Card(
                elevation: 10.0,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    new Container(
                      padding: EdgeInsets.only(left: 15.0),
                      child:new TexteFaadil("Faadil"),
                    ),
                    new Container(
                      padding: EdgeInsets.only(right: 15.0),
                      child: new TexteFaadil(new DateConvertisseur().convertirDate(item.pubDate.toString()) , color: Colors.red ,),

                    ),
                  ],
                ),
                new TexteFaadil(item.title),
                new Card(
                  elevation: 7.5,
                  child: new Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: new Image.network(item.enclosure.url , fit:BoxFit.fill),

                  ),
                )
        ]
            )




              ),
            );
        }
    );
  }

}