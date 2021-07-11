import 'package:covid19_tracker/homepage.dart';
import 'package:flutter/material.dart';
import 'package:covid19_tracker/routes/routes.dart';
import 'chartsview.dart';
import 'countriesview.dart';
import 'faqview.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor:Colors.pinkAccent,
      accentColor: Colors.cyan,

    ),
    home: HomePage(),
    routes: {
      routes.homepage:(context)=>HomePage(),
      routes.charts:(context)=>Graph(),
      routes.countries:(context)=>CountriesView(),
      routes.faq:(context)=>FaqView(),
    },
  ));
}