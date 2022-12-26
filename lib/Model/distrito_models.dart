// To parse this JSON data, do
//
//     final distritoResponsive = distritoResponsiveFromMap(jsonString);

import 'dart:convert';

class DistritoResponsive {
    DistritoResponsive({
       required this.distritos,
    });

    List<Distrito> distritos;

    factory DistritoResponsive.fromJson(String str) => DistritoResponsive.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DistritoResponsive.fromMap(Map<String, dynamic> json) => DistritoResponsive(
        distritos: List<Distrito>.from(json["distritos"].map((x) => Distrito.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "distritos": List<dynamic>.from(distritos.map((x) => x.toMap())),
    };
}

class Distrito {
    Distrito({
      required  this.title,
      required  this.descripcion,
      required  this.latitud,
      required  this.longitud,
      required  this.imagen,
      required  this.restaurant1,
      required  this.imagen1R,
      required  this.direccion1,
      required  this.telefono1,
      required  this.horarios1,
      required  this.restaurant2,
      required  this.imagen2R,
      required  this.direccion2,
      required  this.telefono2,
       required this.horarios2,
       required this.hotel1,
       required this.imagen1,
       required this.star1,
       required this.direccion1H,
       required this.precio1,
       required this.telefonohotel,
       required this.id,
    });

    String title;
    String descripcion;
    double latitud;
    double longitud;
    String imagen;
    String restaurant1;
    String imagen1R;
    String direccion1;
    String telefono1;
    String horarios1;
    String restaurant2;
    String imagen2R;
    String direccion2;
    String telefono2;
    String horarios2;
    String hotel1;
    String imagen1;
    int star1;
    String direccion1H;
    int precio1;
    String telefonohotel;
    int id;

    factory Distrito.fromJson(String str) => Distrito.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Distrito.fromMap(Map<String, dynamic> json) => Distrito(
        title: json["title"],
        descripcion: json["descripcion"],
        latitud: json["latitud"].toDouble(),
        longitud: json["longitud"].toDouble(),
        imagen: json["imagen"],
        restaurant1: json["restaurant1"],
        imagen1R: json["imagen1R"],
        direccion1: json["direccion1"],
        telefono1: json["telefono1"],
        horarios1: json["horarios1"],
        restaurant2: json["restaurant2"],
        imagen2R: json["imagen2R"],
        direccion2: json["direccion2"],
        telefono2: json["telefono2"],
        horarios2: json["horarios2"],
        hotel1: json["hotel1"],
        imagen1: json["imagen1"],
        star1: json["star1"],
        direccion1H: json["direccion1H"],
        precio1: json["precio1"],
        telefonohotel: json["telefonohotel"],
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "title": title,
        "descripcion": descripcion,
        "latitud": latitud,
        "longitud": longitud,
        "imagen": imagen,
        "restaurant1": restaurant1,
        "imagen1R": imagen1R,
        "direccion1": direccion1,
        "telefono1": telefono1,
        "horarios1": horarios1,
        "restaurant2": restaurant2,
        "imagen2R": imagen2R,
        "direccion2": direccion2,
        "telefono2": telefono2,
        "horarios2": horarios2,
        "hotel1": hotel1,
        "imagen1": imagen1,
        "star1": star1,
        "direccion1H": direccion1H,
        "precio1": precio1,
        "telefonohotel": telefonohotel,
        "id": id,
    };
}
