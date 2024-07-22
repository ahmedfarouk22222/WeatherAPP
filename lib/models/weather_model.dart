class Weathermodel {
  final String cityname;
  final DateTime date;
  final String image;
  final double temp;
  final double maxtemp;
  final double minitemp;
  final String status;
  Weathermodel(
      {required this.cityname,
      required this.date,
    required  this.image,
      required this.maxtemp,
      required this.minitemp,
      required this.status,
      required this.temp});
  factory Weathermodel.fromJson(json) {
    return Weathermodel(
      cityname: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minitemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      status: json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
