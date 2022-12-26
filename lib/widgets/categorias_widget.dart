import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turismo/Model/danza_models.dart';
import 'package:turismo/Model/distrito_models.dart';
import 'package:turismo/Provider/danza_provider.dart';
import 'package:turismo/Provider/distrito_provider.dart';

class CategoriasWidgets extends StatelessWidget {
  const CategoriasWidgets({super.key});

  @override
  Widget build(BuildContext context) {
     final danzaProvider =
        Provider.of<DanzaProvider>(context, listen: true);
    final List<Danza> danza = danzaProvider.danzaList;

    return Column(
      children: [
        Text('Danzas',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color.fromARGB(217, 255, 8, 8))),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             ...danza.map((e) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                //width: MediaQuery.of(context).size.width,
                decoration:  BoxDecoration(
                  color: Color.fromARGB(255, 181, 93, 30).withOpacity(.6),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                   
                    Column(
                      children: [
                        Text(
                         e.danzaDeViento1.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(e.images.toString(),width: 300,))
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nombre : ${ e.danzaDeViento1.toString()}',
                          style: TextStyle(
                              color: Color.fromARGB(255, 9, 9, 9),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          'Danza : ${ e.danzaViento2.toString()}',
                          style: TextStyle(
                              color: Color.fromARGB(255, 9, 9, 9),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          'Banda 1 : ${ e.bandasMedianas.toString()}',
                          style: TextStyle(
                              color: Color.fromARGB(255, 9, 9, 9),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          'Banda 2 : ${ e.bandasMedianas2.toString()}',
                          style: TextStyle(
                              color: Color.fromARGB(255, 9, 9, 9),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text(
                          'Categoria: ${ e.title.toString()}',
                          style: TextStyle(
                              color: Color.fromARGB(255, 9, 9, 9),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),)
            ],
          ),
        )
      ],
    );
  }
}
