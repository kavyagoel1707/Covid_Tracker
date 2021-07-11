import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'drawer.dart';
import 'package:http/http.dart' as http;
import 'package:covid19_tracker/search.dart';
class CountriesView extends StatefulWidget {
  static const String routeName='/countries';
  @override
  _CountriesViewState createState() => _CountriesViewState();
}

class _CountriesViewState extends State<CountriesView> {
  late Map data={};
  late List userData=[];
  Future getData() async{
    http.Response response = await http.get(Uri.parse('https://corona-api.com/countries'));
    data=json.decode(response.body);
    setState(() {
      userData= data["data"];
    });
    debugPrint(userData.toString());
  }
  @override
  void initState(){
    super.initState();
    getData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: const Text('Country Stats'),
        centerTitle: false,
      ),
      body: ListView.builder(itemCount: userData==null? 0:userData.length,
      itemBuilder: (BuildContext context,int index){
        return Container(
          margin: EdgeInsets.all(4),
          child: Card(
            child: Container(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 5, 10,10),
                        child: Text("Population: "+ userData[index]['population'].toString(),style:TextStyle(fontSize: 16,
                            color: Colors.red[400],fontWeight: FontWeight.bold)),
                      ),

                      Container(
                        margin: EdgeInsets.fromLTRB(10,5,10,10),
                        child: Text('Active: '+userData[index]['latest_data']['confirmed'].toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.lightGreen[300])),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10,5,10,10),
                        child: Text('Recovered: '+userData[index]['latest_data']['recovered'].toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.lightBlue[200])),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10,5,10,10),
                        child: Text('Deaths: '+userData[index]['latest_data']['deaths'].toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black54)),
                      )
                    ],
                  ),
                  Container(
                    margin:EdgeInsets.fromLTRB(10,10,10,10),
                    padding: EdgeInsets.fromLTRB(10,10,10,10),
                    color: Colors.lightBlue[200],
                    child: Text(userData[index]['name'].toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                  )
                ],
              )
            ),
          ),
        );
      },),
        drawer: createDrawer(context)
    );
  }
}

