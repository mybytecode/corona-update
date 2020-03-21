class CountryLatLng
{
  final String name,iso2;
  final double lat,lng;

  CountryLatLng( { this.name, this.iso2, this.lat, this.lng } );

  factory CountryLatLng.fromJson( Map< String, dynamic >json )
  {
    return CountryLatLng(
      name: json[ 'name' ],
      iso2: json[ 'country' ],
      lat: json[ 'latitude' ],
      lng: json[ 'longitude' ]
    );
  }
}