class Countries
{
  final int cases,todayCases,deaths,todayDeaths,recovered,critical;
  final String country;

  Countries( { this.cases, this.todayCases, this.deaths, this.todayDeaths, this.recovered, this.critical, this.country } );

  factory Countries.fromJson( Map< String, dynamic > json)
  {
    return Countries(
      cases: json[ 'cases' ],
      todayCases: json[ 'todayCases' ],
      deaths: json[ 'deaths' ],
      todayDeaths: json[ 'todayDeaths' ],
      recovered: json[ 'recovered' ],
      critical: json[ 'critical' ],
      country: json[ 'country' ]
    );
  }
}