import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:turismo/Model/recurso_model.dart';
import 'package:turismo/Pages/recursos_pages.dart';
import 'package:turismo/Provider/recursos_provider.dart';
import 'package:provider/provider.dart';

class RecursoTuristicosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recursoProvider =
        Provider.of<RecursosProvider>(context, listen: true);
    final List<Recurso> recurso = recursoProvider.recursoList;
    return Column(
      children: [
         //no cambia
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: Text('Recursos Turisticos'.toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color.fromARGB(217, 255, 28, 28))),
        ),

        //Slider Horizontal
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...recurso.map((e) => RecursoSlider(
                    place: e,
                    onmandarina: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RecursoPage(data: e)));
                    },
                  )).toList()
              // ...List.generate(
              //   recursoProvider.recursoList.length,
              //   (index) => RecursoSlider(recursoProvider: recursoProvider),
              // )
            ],
          ),
        )
      ],
    );
  }
}

class RecursoSlider extends StatelessWidget {
  RecursoSlider({
    Key? key,
    required this.onmandarina,
    required this.place,
  }) : super(key: key);

  Function onmandarina;
  Recurso place;

  @override
  Widget build(BuildContext context) {
    double  width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 300,
      width: width,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecursoPage(
                            data: place,
                          )));
            },
            child: Container(
             height: 270,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 192, 191, 191),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 235, 210, 99),
                      offset: Offset.zero,
                      spreadRadius: 1.5,
                      blurRadius: 0)
                ],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(place.image)),
              ),
            ),
          ),
          Text(
            place.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
