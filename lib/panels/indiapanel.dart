import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class IndiaPanel extends StatefulWidget {

  @override
  State<IndiaPanel> createState() => _IndiaPanelState();
}

class _IndiaPanelState extends State<IndiaPanel> {
  late Map IndiaData={};
  Future getIndiaData() async{
    http.Response response = await http.get(Uri.parse('https://corona-api.com/countries/IN'));
    IndiaData=json.decode(response.body);
  }
@override
void initState(){
    super.initState();
    getIndiaData();
}
  Widget build(BuildContext context) {
    return Container(
        child: GridView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,childAspectRatio: 2 ),
          children: <Widget>[
            StatusPanel(
              title: 'Confirmed',
              boxColor: Colors.white,
              textColor: Colors.red,
              count: IndiaData['data']['latest_data']['confirmed'].toString(),
            ),
            StatusPanel(
              title: 'Critical',
              boxColor: Colors.white,
              textColor: Colors.lightGreen,
              count: IndiaData['data']['latest_data']['critical'].toString(),
            ),
            StatusPanel(
              title: 'Recovered',
              boxColor: Colors.white,
              textColor: Colors.blue,
              count: IndiaData['data']['latest_data']['recovered'].toString(),
            ),
            StatusPanel(
              title: 'Deaths',
              boxColor: Colors.white,
              textColor: Colors.black,
              count: IndiaData['data']['latest_data']['deaths'].toString(),
            ),
          ],
        )
    );
  }
}
class StatusPanel extends StatelessWidget {
  final Color boxColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key? key, required this.boxColor, required this.textColor, required this.title, required this.count})
      : super(key: key);


  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(7),
      color: boxColor,
      height:80,width: width/2,
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,style: TextStyle(fontWeight:FontWeight.bold,fontSize:16,color: textColor),),Text(count,style: TextStyle(fontWeight:FontWeight.bold,fontSize:16,color: textColor),)
        ],
      ),

    );
  }
}
