// To parse this JSON data, do
//
//     final recursoResponsive = recursoResponsiveFromMap(jsonString);

import 'dart:convert';

class RecursoResponsive {
    RecursoResponsive({
       required  this.recursos,
    });

    List<Recurso> recursos;

    factory RecursoResponsive.fromJson(String str) => RecursoResponsive.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RecursoResponsive.fromMap(Map<String, dynamic> json) => RecursoResponsive(
        recursos: List<Recurso>.from(json["recursos"].map((x) => Recurso.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "recursos": List<dynamic>.from(recursos.map((x) => x.toMap())),
    };
}

class Recurso {
    Recurso({
      required  this.name,
       required this.image,
       required this.descripcion,
       required this.data1,
       required this.data2,
       required this.data3,
       required this.data4,
       required this.data5,
       required this.data6,
       required this.data7,
       required this.id,
    });

    String name;
    String image;
    String descripcion;
    String data1;
    String data2;
    String data3;
    String data4;
    String data5;
    String data6;
    String data7;
    int id;

    factory Recurso.fromJson(String str) => Recurso.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Recurso.fromMap(Map<String, dynamic> json) => Recurso(
        name: json["name"],
        image: json["image"],
        descripcion: json["descripcion"],
        data1: json["data1"],
        data2: json["data2"],
        data3: json["data3"],
        data4: json["data4"],
        data5: json["data5"],
        data6: json["data6"],
        data7: json["data7"],
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "image": image,
        "descripcion": descripcion,
        "data1": data1,
        "data2": data2,
        "data3": data3,
        "data4": data4,
        "data5": data5,
        "data6": data6,
        "data7": data7,
        "id": id,
    };
}
