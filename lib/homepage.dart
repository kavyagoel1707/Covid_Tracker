import 'dart:convert';
import 'package:covid19_tracker/datasource.dart';
import 'package:covid19_tracker/panels/indiapanel.dart';
import 'package:covid19_tracker/panels/worldwidepanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'drawer.dart';
import 'package:covid19_tracker/panels/infopanel.dart';
import 'dart:async';
late String stringResponse;
class HomePage extends StatefulWidget {
  static const String routeName='/homepage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: false,
        title: Text('CovidWatch'),
        backgroundColor: Colors.pink[200],
      ),
      drawer: createDrawer(context),
      body: SingleChildScrollView(child:Column(
        children: <Widget>[
          Container(
            height:63,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            color: Colors.green[100],
            child: Text(DataSource.quote,style:TextStyle(color: Colors.green[800],fontSize: 16,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:9.0),
            child: Text('Worldwide',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),),
          ),
          WorldwidePanel(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:9.0),
            child: Text('India',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),),
          ),
          IndiaPanel(),
          SizedBox(height:20,),
          InfoPanel(),
          SizedBox(height:20,),
          Text('WE ARE TOGETHER IN THIS FIGHT',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))

        ],
      )),
    );
  }
}
