import 'package:flutter/material.dart';
import 'package:turismo/Pages/muni_page.dart';
import 'package:turismo/Provider/distrito_provider.dart';
import 'package:turismo/clima%20servis/pages/home_pages.dart';
import 'package:turismo/widgets/categorias_widget.dart';
import 'package:turismo/widgets/distritos_widget.dart';
import 'package:turismo/widgets/recursos_turisticos_widget.dart';
import 'package:turismo/widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DistritoProvider> listData = [];

  DistritoProvider data = DistritoProvider();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 0, top: 0),
                child: Column(
                  children: [
                    Container(
                       height: height * .50,
                      decoration: _Decoration_image(),
                      width: double.infinity,
                      child: Stack(
                        children: [
                          
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SingleChildScrollView(
                              child: SafeArea(
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 41, 25, 6)
                                          .withOpacity(0.40),
                                      borderRadius: BorderRadius.circular(45)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: height * .05,),
                                      const Text(
                                        'Urubamba',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(243, 255, 255, 255),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 35),
                                      ),
                                      const Text(
                                        'Municipalidad Provincial',
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromARGB(243, 255, 255, 255),
                                        ),
                                      ),
                                   
                                      const Divider(
                                        color: Color.fromARGB(255, 94, 255, 0),
                                      ),
                                      const Text(
                                        'Bienvenidos',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(221, 247, 245, 245)),
                                      ),
                                      const Text(
                                        'A la Provincia Arqueológica del Perú',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            color:
                                                Color.fromARGB(255, 225, 222, 222)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const SearchWidget(),
                                      Divider(
                                        color: Color.fromARGB(255, 180, 255, 5),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.email,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Correo : turismo@muniurubamba.gob.pe',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
                                                color: Color.fromARGB(
                                                    255, 225, 222, 222)),
                                          ),
                                        ],
                                      ),
                                      ClimaPage(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Imagen Logo Municialidad
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MunicipalidadPage()));
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 100),
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255)
                                      .withOpacity(0.70),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.home,
                                  color: Color.fromARGB(197, 85, 43, 255),
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            
                    const Divider(),
                    DistritosWIdget(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    RecursoTuristicosWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    const CategoriasWidgets(),               
                   
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration _Decoration_image() {
    return const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(45), bottomLeft: Radius.circular(45)),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 9),
              blurRadius: 2,
              color: Color.fromARGB(189, 1, 43, 66))
        ],
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://www.wayraqperu.com/wp-content/uploads/2020/04/U1.jpg')));
  }
}
