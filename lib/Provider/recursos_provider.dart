
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:turismo/Model/recurso_model.dart';
import 'package:turismo/utils/api_key.dart';

class RecursosProvider extends ChangeNotifier {
  String _baseUrl = 'api.sheety.co';
  String _api_key = '$pathKey/recursos';
  
  List<Recurso> recursoList= [];
  RecursosProvider(){
    print('Recursos Provider inicializado');
    getRecursosProvider();
  }

  getRecursosProvider() async{
  //https://api.sheety.co/220b4fbadb0341d8345b8a56d0fbf8bc/distritosDeLaProvinciaDeUrubamba/recursos
    var url = Uri.https(_baseUrl,'$pathKey/recursos',{
      'api_key': _api_key,
    });

    final response = await http.get(url);
    final decodeData = RecursoResponsive.fromJson(response.body);
    // print(decodeData.recursos);
    recursoList = decodeData.recursos;
    notifyListeners();

  }
  
}