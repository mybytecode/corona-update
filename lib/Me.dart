import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Me extends StatefulWidget
{

  @override
  State<StatefulWidget> createState() => MeState();
}

class MeState extends State< Me >
{

  var bgColors = Colors.black12;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          margin: EdgeInsets.only( top: 100,right: 30 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: bgColors,
                    borderRadius: BorderRadius.circular( 10 )
                ),
                child: Row(
                  children: <Widget>[
                    Text( 'FIND ME HERE' )
                  ],
                ),
              ),


              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: bgColors,
                    borderRadius: BorderRadius.circular( 10 )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton( onPressed: (){
                      launch( 'https://stackoverflow.com/users/12481479/my-bytecode' );
                    },icon: Icon( FontAwesomeIcons.stackOverflow,color: Colors.orange,size: 30, ), ),
                    IconButton( onPressed: (){
                      launch( 'https://instagram.com/akshay_galande_' );
                    },icon: Icon( FontAwesomeIcons.instagram,color: Colors.deepOrangeAccent,size: 30, ), ),
                    IconButton( onPressed: (){
                      launch( 'http://www.linkedin.com/in/akshaygalande' );
                    },icon: Icon( FontAwesomeIcons.linkedinIn,color: Colors.indigo,size: 30, ), ),
                    IconButton( onPressed: (){
                      launch( 'https://github.com/mybytecode' );
                    },icon: Icon( FontAwesomeIcons.github,color: Colors.white,size: 30, ), )
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: bgColors,
                    borderRadius: BorderRadius.circular( 10 )
                ),
                child: Row(
                  children: <Widget>[
                    Text( 'Suppport Project' )
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: bgColors,
                    borderRadius: BorderRadius.circular( 10 )
                ),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon( FontAwesomeIcons.korvue ),
                      onPressed: (){
                        launch( 'https://ko-fi.com/mybytecode' );
                      },
                    )
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: bgColors,
                    borderRadius: BorderRadius.circular( 10 )
                ),
                child: Row(
                  children: <Widget>[
                    Text( 'Thanks To' )
                  ],
                ),
              ),


              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: bgColors,
                    borderRadius: BorderRadius.circular( 10 )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      child: Container( padding: EdgeInsets.all( 10 ),decoration: BoxDecoration( color: Colors.blueAccent, borderRadius: BorderRadius.circular( 7 ) ),  child: Text( 'WHO', style: TextStyle( fontWeight: FontWeight.bold ), ), ) ,
                      onTap: (){
                        launch( 'https://www.who.int/' );
                      },
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      )
    );
  }

}