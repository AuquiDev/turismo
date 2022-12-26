import 'package:flutter/material.dart';
import 'package:turismo/Model/distrito_models.dart';
import 'package:turismo/mapspage.dart';

class DistritoPage extends StatelessWidget {
  DistritoPage({Key? key, required this.data}) : super(key: key);

  Distrito data;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: height * 0.38,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(42.0),
                          bottomLeft: Radius.circular(42)),
                      image: DecorationImage(
                        image: NetworkImage(data.imagen),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: const [
                        BoxShadow(offset: Offset(0, 6), blurRadius: 6)
                      ]),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(42.0),
                              bottomLeft: Radius.circular(42)),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.center,
                            colors: [
                              const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.5),
                              const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.5),
                              const Color.fromARGB(136, 48, 31, 42)
                                  .withOpacity(0.5),
                              const Color.fromARGB(0, 14, 166, 153),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(46.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          height: 1.2,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const Text(
                                        "MUNICIPALIDAD PROVINCIAL",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16.0),
                                      ),
                                      const Text(
                                        "DIVICION DE TURISMO",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 120,
                                  width: 70,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(232, 247, 9, 9)),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MapsPage(
                                                    data: data,
                                                  )));
                                    },
                                    icon: const Icon(
                                      Icons.location_on,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      size: 50.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            "HISTORIA",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Text(
                        data.descripcion,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            height: 1.5,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54),
                      ),
                      Text(data.telefono1),
                       SizedBox(
                        height: height*.45,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * .4,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 220, 236, 129),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 218, 229, 155),
                      blurRadius: 80,
                      offset: Offset(0, -40),
                    )
                  ]),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 22),
              child: SingleChildScrollView(
                child: Expanded(
                  child: Column(
                    children: [
                      Text(
                        " Resturants".toUpperCase(),
                        style: const TextStyle(
                          color: Color.fromARGB(212, 223, 28, 28),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(),
                      RestaurantWidget(
                        telefono: data.telefono1,
                        direccionName: data.direccion1,
                        data: data,
                        restaurantName: data.restaurant1,
                        imagen: data.imagen1R,
                        horario: data.horarios1,
                        star: 0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RestaurantWidget(
                        telefono: data.telefono2,
                        direccionName: data.direccion2,
                        data: data,
                        restaurantName: data.restaurant2,
                        imagen: data.imagen2R,
                        horario: data.horarios2,
                        star: 0,
                      ),

                      Text(
                        " Hoteles".toUpperCase(),
                        style: const TextStyle(
                          color: Color.fromARGB(212, 223, 28, 28),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(),
                      RestaurantWidget(
                        telefono: data.telefonohotel,
                        direccionName: data.direccion1H,
                        data: data,
                        restaurantName: data.hotel1,
                        imagen: data.imagen1,
                        horario: data.precio1.toString(),
                        star: data.star1,
                      ),
                     
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RestaurantWidget extends StatelessWidget {
  RestaurantWidget(
      {super.key,
      required this.data,
      required this.restaurantName,
      required this.direccionName,
      required this.imagen,
      this.star,
      required this.horario,
  required this.telefono
      });
  Distrito data;
  String restaurantName;
  String direccionName;
  String imagen;
  int? star;
  String horario;
  String telefono;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "::: ${restaurantName}",
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Row(children: [
              Text(
                " Direccion:",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "(${direccionName})",
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ]),
          ],
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(imagen)),
        Row(
          children: [
            Row(
              children: List.generate(
                star!,
                (index) => const Icon(
                  Icons.star,
                  color: Color(0xffFEAA36),
                  size: 22.0,
                ),
              ),
            ),
            const SizedBox(
              width: 6.0,
            ),
            Row(
              children: [
                Text(
                  star.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " (${star} estrellas)",
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.phone),
            Text(
              telefono.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              " (Horarios atencion: ${data.horarios1} )",
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
