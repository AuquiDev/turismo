// To parse this JSON data, do
//
//     final productoServices = productoServicesFromMap(jsonString);

import 'dart:convert';

import 'dart:convert';


class RestaurantResponsive {
    RestaurantResponsive({
       required this.restaurants,
    });

    List<Restaurant> restaurants;

    factory RestaurantResponsive.fromJson(String str) => RestaurantResponsive.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RestaurantResponsive.fromMap(Map<String, dynamic> json) => RestaurantResponsive(
        restaurants: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toMap())),
    };
}

class Restaurant {
    Restaurant({
      required  this.nombre,
      required  this.descripcion,
      required  this.telefono,
      required  this.ubicacion,
      required  this.atencion,
      required  this.image,
      required  this.id,
    });

    String nombre;
    String descripcion;
    String telefono;
    String ubicacion;
    String atencion;
    String image;
    int id;

    factory Restaurant.fromJson(String str) => Restaurant.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Restaurant.fromMap(Map<String, dynamic> json) => Restaurant(
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        telefono: json["telefono"],
        ubicacion: json["ubicacion"],
        atencion: json["atencion"],
        image: json["image"],
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "telefono": telefono,
        "ubicacion": ubicacion,
        "atencion": atencion,
        "image": image,
        "id": id,
    };
}
