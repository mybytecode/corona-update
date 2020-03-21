import 'package:coronavirus/Me.dart';
import 'package:coronavirus/controller/api_controller.dart';
import 'package:coronavirus/model/Info.dart';
import 'package:coronavirus/model/base_model.dart';
import 'package:coronavirus/model/countries.dart';
import 'package:coronavirus/model/country_lat_lng.dart';
import 'package:coronavirus/search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map/map_styles.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    home: DashBoard(),
  )
);

class DashBoard extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => DashBoardState();

}

class DashBoardState extends State< DashBoard >
{

  final  Color TEXT_COLOR = Colors.black;
  Color secondary = Colors.black87;
  final LatLng _center = const LatLng(19.663280,	75.300293);
  GoogleMapController mapController;

  BaseModel data;
  List< Countries > countries;
  List< CountryLatLng > latLng;
  Set<Marker> marker = Set();
  List< LatLng > point = List();
  Set< Polygon > polygon = Set();


  @override
  void initState() {
    super.initState();
    ApiController().getBaseData().then( ( value ){
      setState(() {
        data  = value;
      });
    } );

    ApiController().getCountryLatLng(context).then( ( values ){
      setState(() {
        latLng = values;

      });
    } );

    ApiController().getCountries().then( ( value ){
      setState(() {
        countries = value;

        Future.delayed( const Duration( seconds: 2 ),(){
          addMarker( countries[ 0 ] );
        } );
      });
    } );

  }

  void _onMapCreated(GoogleMapController controller)
  {
    mapController = controller;
    mapController.setMapStyle( MapStyles.MAP_STYLE_AUBERGINE );
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          
            child:Stack(
              children: <Widget>[
                map(),
                Positioned(
                  top: 10,
                  child: Container(
                    height: 100,
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                      borderRadius: BorderRadius.circular( 10 )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text( data != null ? data.deaths.toString() : '--',style: TextStyle( fontSize: 20,fontWeight: FontWeight.bold, color: TEXT_COLOR ) ),
                              SizedBox( height: 5, ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon( FontAwesomeIcons.skullCrossbones,size: 15,color: Colors.red, ),
                                  SizedBox( width: 10, ),
                                  Text( 'Deaths',style: TextStyle( color: Colors.red ), )
                                ],
                              ),
                            ],
                          )
                        ),
                        Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text( data != null ? data.cases.toString() : '--',style: TextStyle( fontSize: 20,fontWeight: FontWeight.bold, color: TEXT_COLOR ) ),
                                SizedBox( height: 5, ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Icon( FontAwesomeIcons.buffer,size: 15,color: Colors.blue, ),
                                    SizedBox( width: 10, ),
                                    Text( 'Affected',style: TextStyle( color: Colors.blue ), )
                                  ],
                                ),
                              ],
                            )
                        ),
                        Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text( data != null ? data.recovered.toString() : '--',style: TextStyle( fontSize: 20,fontWeight: FontWeight.bold, color: TEXT_COLOR ), ),
                                SizedBox( height: 5, ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Icon( Icons.check,color:Colors.green,size: 15, ),
                                    SizedBox( width: 10, ),
                                    Text( 'Recoverd',style: TextStyle( color: Colors.green ), )
                                  ],
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 130,
                  right: 10,
                  child: CircleAvatar(
                    child: IconButton(
                      icon: Icon( Icons.search, size: 30, ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute( builder: ( context )=>Search() ));
                      },
                    ),
                  )
                ),
                Positioned(
                    top: 180,
                    right: 10,
                    child: CircleAvatar(
                      child: IconButton(
                        icon: Icon( FontAwesomeIcons.hospital ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute( builder: ( context )=>Info() ));
                        },
                      ),
                    )
                ),
                Positioned(
                    top: 230,
                    right: 10,
                    child: CircleAvatar(
                      child: IconButton(
                        icon: Icon( Icons.info_outline ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute( builder: ( context )=>Me() ));
                        },
                      ),
                    )
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only( left: 10,bottom: 10 ),
                    child: bottomList(),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }

  Widget map()
  {

    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 0.0
      ),
      scrollGesturesEnabled: true,
      zoomGesturesEnabled: true,
      myLocationButtonEnabled: false,
      gestureRecognizers: Set()
        ..add( Factory<PanGestureRecognizer>(() => PanGestureRecognizer())),
      markers: marker,
      polygons: polygon,
    );
  }


  Widget bottomList()
  {
    return Container(
      height: 150,
      child: ListView.separated(
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
          itemBuilder: ( BuildContext context, int index )
          {
            return GestureDetector(
              child: Container(
                padding: EdgeInsets.all( 10 ),
                width: MediaQuery.of(context).size.width - 50,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular( 20 )
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                                child: Text( countries != null ? countries[ index ].country : '- -' ,style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20, color: TEXT_COLOR ))
                            ),
                            SizedBox( height: 5,),
                            Text( 'Country', style: TextStyle( color: secondary ), ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                                child: Text( countries != null ? countries[ index ].cases.toString() : '- -' ,style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20,color: TEXT_COLOR ))
                            ),
                            SizedBox( height: 5,),
                            Text( 'Cases',style: TextStyle( color: secondary ) ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                                child: Text( countries != null ? countries[ index ].deaths.toString() : '- -' ,style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20,color: TEXT_COLOR ))
                            ),
                            SizedBox( height: 5,),
                            Text( 'Deaths',style: TextStyle( color: secondary ) ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox( height: 20, ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                                child: Text( countries != null ? countries[ index ].recovered.toString() : '- -' ,style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20 ,color: TEXT_COLOR))
                            ),
                            SizedBox( height: 5,),
                            Text( 'Recovered',style: TextStyle( color: secondary ) ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                                child: Text( countries != null ? countries[ index ].critical.toString() : '- -' ,style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20,color: TEXT_COLOR ))
                            ),
                            SizedBox( height: 5,),
                            Text( 'Critical',style: TextStyle( color: secondary ) ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                                child: Text( countries != null ? countries[ index ].todayDeaths.toString() : '- -' ,style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20,color: TEXT_COLOR ))
                            ),
                            SizedBox( height: 5,),
                            Text( 'Today Deaths',style: TextStyle( color: secondary ) ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              onTap: (){
                addMarker( countries[ index ] );
              },
            );
          },
          separatorBuilder: ( BuildContext context, int index )
          {
            return SizedBox( width: 20, );
          },
          itemCount: countries != null ? countries.length : 1
      )
    );
  }


  @override
  void dispose() {
    super.dispose();
  }

  String getCountry()
  {
    return Localizations.localeOf(context).countryCode;
  }

  void addMarker( Countries country )
  {
    CountryLatLng countryData;

    latLng.forEach( ( value ){
      if( value.name == country.country )
        {
          countryData = value;
        }
    } );

    print( countryData.name + '-------------' );

    List<Marker> markers = [
      Marker(
          markerId: MarkerId( countryData.iso2 ),
          infoWindow: InfoWindow(
            title: country.deaths.toString(),
            snippet: 'Deaths'
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue( BitmapDescriptor.hueRed ),
          position:  LatLng( countryData.lat ,  countryData.lng ),

      ),
    ];
    marker.clear();
    marker.addAll( markers );

    setState(() {
      if( mapController != null )
        {
          mapController.animateCamera(
            CameraUpdate.newCameraPosition( CameraPosition( target: LatLng( countryData.lat , countryData.lng ) ) ),
          );
        }
    });

    Future.delayed( const Duration( seconds: 1 ),(){
      setState(() {
        if( mapController != null )
          {
            mapController.showMarkerInfoWindow( MarkerId( countryData.iso2 ) );
          }
      });
    } );
  }
}