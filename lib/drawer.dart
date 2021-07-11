import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:covid19_tracker/routes/routes.dart';

Widget createDrawer(BuildContext context){
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          color: Colors.white,
          child: DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/covid.jpeg'),
                fit:BoxFit.cover
              )
            ),
            child: Text(
              '             ',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
        ),
        ListTile(
          title: Text('CovidWatch',style: TextStyle(fontSize: 16),),
          onTap: (){
            Navigator.pushReplacementNamed(context,routes.homepage);
          },
        ),
        ListTile(
          title: Text('Charts',style: TextStyle(fontSize: 16),),
          onTap: (){
            Navigator.pushReplacementNamed(context,routes.charts);
          },
        ),
        ListTile(
          title: Text('Country Statistics',style: TextStyle(fontSize: 16),),
          onTap: (){
            Navigator.pushReplacementNamed(context,routes.countries);
          },
        ),
        ListTile(
          title: Text('FAQs',style: TextStyle(fontSize: 16),),
          onTap: (){
            Navigator.pushReplacementNamed(context,routes.faq);
          },
        ),
      ],
    ),
  );
}