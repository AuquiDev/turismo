// To parse this JSON data, do
//
//     final danzaResponsive = danzaResponsiveFromMap(jsonString);

import 'dart:convert';

class DanzaResponsive {
    DanzaResponsive({
      required  this.danza,
    });

    List<Danza> danza;

    factory DanzaResponsive.fromJson(String str) => DanzaResponsive.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DanzaResponsive.fromMap(Map<String, dynamic> json) => DanzaResponsive(
        danza: List<Danza>.from(json["danza"].map((x) => Danza.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "danza": List<dynamic>.from(danza.map((x) => x.toMap())),
    };
}

class Danza {
    Danza({
         this.danzaDeViento1,
         this.danzaViento2,
        this.bandasMedianas,
        this.bandasMedianas2,
        this.title,
        this.images,
        this.id,
    });

    String? danzaDeViento1;
    String? danzaViento2;
    String? bandasMedianas;
    String? bandasMedianas2;
    String? title;
    String? images;
    int? id;

    factory Danza.fromJson(String str) => Danza.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Danza.fromMap(Map<String, dynamic> json) => Danza(
        danzaDeViento1: json["danzaDeViento1"],
        danzaViento2: json["danzaViento2"],
        bandasMedianas: json["bandasMedianas"],
        bandasMedianas2: json["bandasMedianas2"],
        title: json["title"],
        images: json["images"],
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "danzaDeViento1": danzaDeViento1,
        "danzaViento2": danzaViento2 == null ? null : danzaViento2,
        "bandasMedianas": bandasMedianas == null ? null : bandasMedianas,
        "bandasMedianas2": bandasMedianas2 == null ? null : bandasMedianas2,
        "title": title == null ? null : title,
        "images": images == null ? null : images,
        "id": id,
    };
}
