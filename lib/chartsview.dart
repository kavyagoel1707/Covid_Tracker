
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'package:charts_flutter/flutter.dart'as charts;
import 'package:covid19_tracker/deaths.dart';
import 'package:covid19_tracker/datasource.dart';


class Confirmed{
  late int month;
  late int confirmed;
  Confirmed( this.month , this.confirmed);
}
final data=[
  new Confirmed(1,10733131),
  new Confirmed(2,11096731),
  new Confirmed(3,12149335),
  new Confirmed(4,18762976),
  new Confirmed(5,28307832),
  new Confirmed(6,30262848),
  new Confirmed(7,30974587),
];
class Graph extends StatefulWidget {
  static const String routeName='/charts';
  const Graph({ Key? key }) : super(key: key);

  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  _getSeriesData() {
    List<charts.Series<Confirmed, int>> series = [
      charts.Series(
        id: "Sales",
        data: data,
        seriesColor: charts.MaterialPalette.black,
        domainFn: (Confirmed series, _) => series.month,
        measureFn: (Confirmed series, _) => series.confirmed,
        colorFn: (Confirmed series, _) => charts.MaterialPalette.black,

      )
    ];
    return series;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.indigo[200],
          centerTitle: false,
          title: Text("Charts",style: TextStyle(
            color:Colors.white,
            letterSpacing: 2,
            fontWeight: FontWeight.w700,
          ),),
        ),
      drawer: createDrawer(context),
        //backgroundColor: Colors.black,
        body:SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(height:63,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                color: Colors.black12,
                child: Text(DataSource.quote2,style:TextStyle(color: Colors.indigo[300],fontSize: 16,fontWeight: FontWeight.bold),),
              ),
              Container(
                height:70,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Text('Corona-19 Cases 2021 in India',style:TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  height: 350,
                  width: 350,
                  child:new charts.LineChart(_getSeriesData(), animate: true,),
                ),
              ),
              SizedBox(height:30,),
              Container(
                height:70,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Text('Corona-19 Deaths 2021 in India',style:TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              DeathData(),
              SizedBox(height: 30,),
              Text("WE ARE IN THIS TOGETHER IN THIS FIGHT",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo[300],fontSize:16, )),
            ],
          ),
        )
    );

  }

}