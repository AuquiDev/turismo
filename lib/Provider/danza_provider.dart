
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:turismo/Model/danza_models.dart';
import 'package:turismo/utils/api_key.dart';


class DanzaProvider extends ChangeNotifier {
  String _baseUrl = 'api.sheety.co';
  String _api_key = '$pathKey/danza';
  
  List<Danza> danzaList= [];

  DanzaProvider(){
    print('Danza Provider inicializado');
    getDanzaProvider();
  }

  getDanzaProvider() async{

    var url = Uri.https(_baseUrl,'$pathKey/danza',{
      'api_key': _api_key,
    });

    final response = await http.get(url);
    final decodeData = DanzaResponsive.fromJson(response.body);
    danzaList = decodeData.danza;
    notifyListeners();
  }
  
}