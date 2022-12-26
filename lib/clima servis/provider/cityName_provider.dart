
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:turismo/clima%20servis/models/cityname_models.dart';


class CityNameProvider extends ChangeNotifier {
  String cityName = '';

  String country = '';

  double temp = 0;

  bool isloading = true;

  //List<Weather> cityList = [];

  List<CityNameResponsive> cityresponsive = [];

  CityNameProvider() {
    print('Get city provider inicializado');
    getCityNameProvider('Urcos');
  }

  getCityNameProvider(String city) async {
    isloading = true;
    //setState(() {});
    Uri _url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=7c754f031b87b83b71da3437f2fc99c4');
    http.Response response = await http.get(_url);
    final decodeData = CityNameResponsive.fromJson(response.body);
    //final cityList = decodeData.weather[0].description;//lista
    final cityresponsiveTemp = decodeData.main.temp; //mapa
    final cityresponsiveName = decodeData.name;
    final cityresponsiveCountry = decodeData.sys.country;
    print(decodeData);
    print(cityresponsive);
    

    if (response.statusCode == 200) {
      Map myMap = (json.decode(response.body));
      temp = cityresponsiveTemp;
      temp = temp - 273.15;
      cityName = cityresponsiveName;
      country = cityresponsiveCountry;
      isloading = false;
      //setState(() {});

    }
    notifyListeners();
  }
}
