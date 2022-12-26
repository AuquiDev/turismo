//proveedor de informacion 


import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:turismo/Model/distrito_models.dart';
import 'package:turismo/Model/restaurant_models.dart';
import 'package:turismo/utils/api_key.dart';


class DistritoProvider extends ChangeNotifier {
  String _baseUrl = 'api.sheety.co';
  String _apiKey = '$pathKey/distritos';

List<Distrito> distritoList = [];

List<Restaurant> restaurantList = [];

 DistritoProvider(){
   print('distrito provider inicalizado');
   getDistritoprovider();
   
 }

 //otro metodo para ver los datos mapeados
 getDistritoprovider()async {
  //https://api.sheety.co/220b4fbadb0341d8345b8a56d0fbf8bc/distritosDeLaProvinciaDeUrubamba/distritos
  var url = Uri.https(_baseUrl,'$pathKey/distritos',{
    'api_key': _apiKey
  });
  
  final response = await http.get(url);
  //decodificar la informacion y convertirlo a un Mapa
  final decodeData =  DistritoResponsive.fromJson(response.body);
  // print(decodeData.distritos[0].descripcion); 
  distritoList = decodeData.distritos;
  // print(distritoList);
  notifyListeners();
 }
// https://api.sheety.co/d5f556f91948716e7ec4e8ec878ee899/distritosDeLaProvinciaDeUrubamba/restaurants
getRestaurantprovider()async {
  //https://api.sheety.co/220b4fbadb0341d8345b8a56d0fbf8bc/distritosDeLaProvinciaDeUrubamba/distritos
  var url = Uri.https(_baseUrl,'$pathKey/restaurants',{
    'api_key': _apiKey
  });
  
  final response = await http.get(url);
  //decodificar la informacion y convertirlo a un Mapa
  final decodeData =  RestaurantResponsive.fromJson(response.body);
  // print(decodeData.distritos[0].descripcion); 
  restaurantList = decodeData.restaurants;
  // print(distritoList);
  notifyListeners();
 }


 Future<List<Distrito>> searchProducto(String query) async {
    final url = Uri.https(_baseUrl,'$pathKey/distritos',{
      'api_key': _apiKey,
    });

    final response = await http.get(url);
    final searchResponse = DistritoResponsive.fromJson(response.body);
    
    return searchResponse.distritos;
  }


 Future<List<Restaurant>> searchRestaurant(String query) async {
    final url = Uri.https(_baseUrl,'d5f556f91948716e7ec4e8ec878ee899/distritosDeLaProvinciaDeUrubamba/restaurants',{
      'api_key': _apiKey,
    });

    final response = await http.get(url);
    final searchResponse = RestaurantResponsive.fromJson(response.body);
    
    return searchResponse.restaurants;
  }
}

 