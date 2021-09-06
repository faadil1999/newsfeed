import 'package:flutter/material.dart';
import 'package:flutter_apppractiq/models/parser.dart';
import 'package:flutter_apppractiq/widgets/chargement.dart';
import 'package:webfeed/webfeed.dart';
import 'chargement.dart';
import 'list.dart';
import 'grille.dart';


class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  RssFeed feed;
  int taille = 0;
  @override
  void iniState(){
    print("Kiki lolo");
    super.initState();
    parse();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

      ),
      body: choixDuBody(),
    );

  }

  Widget choixDuBody(){

    if(feed == null){
      Orientation orientation2 = MediaQuery.of(context).orientation;
      print(orientation2);
      parse();
      return new Chargement();
    }
    else {
      Orientation orientation = MediaQuery.of(context).orientation;
      if(orientation == Orientation.portrait){
          return new Liste(feed) ;
      }else{
        print(orientation);
        return new Grille(feed);
      }
    }

  }


  Future <Null> parse() async{
    RssFeed recu = await Parser().chargeRSS();
    if(recu != null){
      setState(() {
        feed = recu;
        print(feed.items.length);
        taille = feed.items.length ;
        feed.items.forEach((feedItem) {
          RssItem item = feedItem;
        return ListView(
            children: [
              new Card(
                elevation: 10.0,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Text(item.title ,
                    style: new TextStyle(
                      color: Colors.blue,
                      fontSize: 10.0,
                      fontStyle: FontStyle.italic
                    ),
                    )
                  ],
                ),
              ),
            ],
          );
        });
      });
    }
  }
}
