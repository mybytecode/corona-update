import 'package:coronavirus/controller/api_controller.dart';
import 'package:coronavirus/model/countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Search extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => SearchState();
}

class SearchState extends State< Search >
{

  TextEditingController editingController = new TextEditingController();

  Countries data;
  var bgColors = Colors.black12;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Search' ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(30),
            child: TextField(
              autofocus: true,
              controller: editingController,
              decoration: InputDecoration(
                  border: OutlineInputBorder( borderSide: BorderSide( color: Colors.black ) ),
                  hintText: 'Enter country name',
                  prefixIcon: Icon( Icons.search )
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width-200,
             margin: EdgeInsets.only( top: 0,left: 50,right: 50 ),
            child: RaisedButton(
              child: Text( 'Search',style: TextStyle( color: Colors.white ), ),
              onPressed: (){
                 ApiController().getByCountry( editingController.text ).then( ( value ) {
                   setState(() {
                     data = value;
                     SystemChannels.textInput.invokeMethod('TextInput.hide');
                   });
                 } );
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: bgColors,
                borderRadius: BorderRadius.circular( 10 )
            ),
            child: ListTile(
              leading:Icon( FontAwesomeIcons.skullCrossbones,size: 30,color: Colors.red, ),
              title: Text( data == null ? '--' : data.deaths.toString() ),
              subtitle: Text( 'Total Deaths' ),
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: bgColors,
                borderRadius: BorderRadius.circular( 10 )
            ),
            child: ListTile(
              leading:Icon( FontAwesomeIcons.heartBroken,size: 30,color: Colors.red, ),
              title: Text( data == null ? '--' : data.todayDeaths.toString() ),
              subtitle: Text( 'Today Deaths' ),
            ),
          ),
          SizedBox( height: 20, ),

          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: bgColors,
                borderRadius: BorderRadius.circular( 10 )
            ),
            child: ListTile(
              leading:Icon( FontAwesomeIcons.heartbeat,size: 30,color: Colors.red, ),
              title: Text( data == null ? '--' : data.critical.toString() ),
              subtitle: Text( 'Critical' ),
            ),
          ),
          SizedBox( height: 20, ),

          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: bgColors,
                borderRadius: BorderRadius.circular( 10 )
            ),
            child: ListTile(
              leading:Icon( FontAwesomeIcons.hospital,size: 30,color: Colors.red, ),
              title: Text( data == null ? '--' : data.cases.toString() ),
              subtitle: Text( 'Cases' ),
            ),
          ),
          SizedBox( height: 20, ),

          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: bgColors,
                borderRadius: BorderRadius.circular( 10 )
            ),
            child: ListTile(
              leading:Icon( FontAwesomeIcons.heart,size: 30,color: Colors.red, ),
              title: Text( data == null ? '--' : data.recovered.toString() ),
              subtitle: Text( 'Recovered' ),
            ),
          ),
          SizedBox( height: 20, ),

          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: bgColors,
                borderRadius: BorderRadius.circular( 10 )
            ),
            child: ListTile(
              leading:Icon( FontAwesomeIcons.clinicMedical,size: 30,color: Colors.red, ),
              title: Text( data == null ? '--' : data.todayCases.toString() ),
              subtitle: Text( 'Today Cases' ),
            ),
          ),
          SizedBox( height: 20, ),
        ],
      )
    );
  }
}