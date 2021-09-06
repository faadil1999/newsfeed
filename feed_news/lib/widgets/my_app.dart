import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter/services.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      //DeviceOrientation.portraitUp,
      //DeviceOrientation.landscapeLeft,

    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.indigo,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(title: 'Faad News'),
      debugShowCheckedModeBanner: false ,
    );
  }
}