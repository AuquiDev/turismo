import 'package:flutter/material.dart';
import 'package:turismo/Model/distrito_models.dart';
import 'package:turismo/Pages/distrito_page.dart';
import 'package:turismo/Provider/distrito_provider.dart';
import 'package:provider/provider.dart';
import 'package:turismo/mapspage.dart';

class DistritosWIdget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final distritoProvider =
        Provider.of<DistritoProvider>(context, listen: true);
    final List<Distrito> distrito = distritoProvider.distritoList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //no cambia
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20,top: 20,bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text('Distritos de Urubamba'.toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromARGB(217, 34, 34, 34))),
              const Text(
                'VER MAS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromARGB(255, 77, 126, 248),
                ),
              ),
            ],
          ),
        ),

        SingleChildScrollView(
          physics: const ScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...distrito
                  .map((e) => ItemSliderWidget(
                        place: e,
                        onMandarina: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DistritoPage(
                                        data: e,
                                      )));
                        },
                      ))
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}

class ItemSliderWidget extends StatelessWidget {
  ItemSliderWidget({super.key, required this.onMandarina, required this.place});
  Function onMandarina;
  Distrito place;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          height: 230,
          width: 180,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(place.imagen)),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(255, 171, 167, 171)
                        .withOpacity(.5),
                    offset: const Offset(.5, 1.5),
                    blurRadius: 0,
                    spreadRadius: 2)
              ]),
        ),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            width: 180,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: const Color.fromRGBO(0, 0, 0, 1).withOpacity(.6),
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DistritoPage(
                                  data: place,
                                )));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 250, 223, 69),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      place.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MapsPage(
                                  data: place,
                                )));
                    },
                    color: Colors.red,
                    icon: const Icon(
                      Icons.location_on,
                      size: 30,
                    )),
              ],
            ))
      ],
    );
  }
}
