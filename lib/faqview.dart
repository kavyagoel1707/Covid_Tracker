
import 'dart:ui';

import 'package:covid19_tracker/datasource.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
class FaqView extends StatelessWidget {
  static const String routeName='/faq';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('FAQs'),
        backgroundColor: Colors.black45,
      ),
        drawer: createDrawer(context),
body: ListView.builder(
    itemCount: DataSource.questionAnswers.length,
    itemBuilder: (context,index){
  return ExpansionTile(title: Text(DataSource.questionAnswers[index]['question'],style:TextStyle(fontWeight: FontWeight.bold)),children:<Widget> [
    Text(DataSource.questionAnswers[index]['answer']),
  ],);
}),

   );
  }
}
