import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class Deaths {
  late int month;
  late int deaths;
  Deaths( this.month , this.deaths);
}
final data=[
  new Deaths(1,2221428),
  new Deaths(2,2531944),
  new Deaths(3,2807945),
  new Deaths (4,3171631),
  new Deaths(5,3541023),
  new Deaths(6,3937846),
  new Deaths(7,3975276),
];

class Graph extends StatefulWidget {
  const Graph({ Key? key }) : super(key: key);

  @override
  _GraphState createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  _getSeriesData() {
    List<charts.Series<Deaths, int>> series = [
      charts.Series(

        id: "Sales",
        data: data,
        seriesColor: charts.MaterialPalette.black,
        domainFn: (Deaths series, _) => series.month,
        measureFn: (Deaths series, _) => series.deaths,
        colorFn: (Deaths series, _) => charts.MaterialPalette.black,

      )
    ];
    return series;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.black,
        //backgroundColor: Colors.black,
        body:Center(
          child: Container(
            color: Colors.white,
            height: 350,
            width: 300,
            child:new charts.LineChart(_getSeriesData(), animate: true,),
          ),
        )
    );

  }

}
