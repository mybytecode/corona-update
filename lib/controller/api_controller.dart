import 'dart:convert';

import 'package:coronavirus/model/base_model.dart';
import 'package:coronavirus/model/countries.dart';
import 'package:coronavirus/model/country_lat_lng.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ApiController
{
  Future<BaseModel> getBaseData() async
  {
    var response = await http.get( 'https://corona.lmao.ninja/all' );

    var data = jsonDecode( response.body );

    return BaseModel.fromJson( data ) ;
  }

  Future< List< Countries > > getCountries()async
  {

    var response = await http.get( 'https://corona.lmao.ninja/countries' );


    List<Countries> parseJson( String response )
    {
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return parsed.map< Countries >((json) => Countries.fromJson(json)).toList();
    }
    return parseJson(response.body);
  }


  Future< Countries > getByCountry( String country ) async
  {
    var response = await http.get( 'https://corona.lmao.ninja/countries/$country' );

    return Countries.fromJson( jsonDecode( response.body ) );
  }

  Future< List< CountryLatLng > > getCountryLatLng( BuildContext context ) async
  {
    var request = await rootBundle.loadString( 'assets/countryLatLong.json' );

    List<CountryLatLng> parseJson( String response )
    {
      final parsed = json.decode( response ).cast<Map<String, dynamic>>();
      return parsed.map< CountryLatLng >(( json ) => CountryLatLng.fromJson( json ) ).toList();
    }
    return parseJson( request );
  }
}