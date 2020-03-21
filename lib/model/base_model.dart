class BaseModel
{
  final int cases,deaths,recovered;

  BaseModel( { this.cases, this.deaths, this.recovered } );

  factory BaseModel.fromJson ( Map< String, dynamic >json ){
    return BaseModel(
      cases: json[ 'cases' ],
      deaths: json[ 'deaths' ],
      recovered: json[ 'recovered' ]
    );
  }
}