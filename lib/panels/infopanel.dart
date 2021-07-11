import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatefulWidget{
  @override
  State<InfoPanel> createState() => _InfoPanelState();
}

class _InfoPanelState extends State<InfoPanel> {
  openURL1(){
    String url1="https://covid.giveindia.org/";
    launch(url1);
  }
  openURL2(){
    String url2="https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters";
    launch(url2);
  }
  openURL3(){
    String url3="https://ncdc.gov.in/index1.php?lang=1&level=1&sublinkid=703&lid=550";
    launch(url3);
  }
@override

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              openURL3();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical:10,horizontal: 15),
              color: Colors.red[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>[
                  Text('Covid Guidelines',style: TextStyle(color: Colors.red[400],fontWeight: FontWeight.bold,fontSize: 18),),
                  Icon(Icons.arrow_forward,color: Colors.red[400],)
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: (){
              openURL2();
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 12,horizontal: 10),
                margin: EdgeInsets.symmetric(vertical:10,horizontal: 15),
                color: Colors.yellow[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget>[
                    Text('Myth Busters',style: TextStyle(color: Colors.yellow[800],fontWeight: FontWeight.bold,fontSize: 18),),
                    Icon(Icons.arrow_forward,color: Colors.yellow[800],)
                  ],
                ),
              ),
          ),

          GestureDetector(
            onTap:() {
              openURL1();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical:10,horizontal: 15),
              color: Colors.blue[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget>[
                  Text('Donate',style: TextStyle(color: Colors.blue[800],fontWeight: FontWeight.bold,fontSize: 18),),
                  Icon(Icons.arrow_forward,color: Colors.blue[800],)
                ],
              ),
            ),
          ),

        ],
      ),
    );

  }
}