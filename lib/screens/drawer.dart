import 'package:flutter/material.dart';
import 'dart:math';

class Draweer extends StatefulWidget {
  const Draweer({super.key});

  @override
  _DraweerState createState() => _DraweerState();
}

class _DraweerState extends State<Draweer> with SingleTickerProviderStateMixin {
  double value = 0;
  //animatedContainer
  double _width = 0;
  double _height = 1300;
  Color colors = Colors.transparent;
  GestureDetector _columna = GestureDetector(child: Container());

  _updateState() {
    setState(() {
      _width = 0;
      _height = 100;
      //cuando hagamos click aparecera este contenido
      _columna = GestureDetector(
        onTap: () => _updateState(),
        child: Container(
          child: Column(
            children: const [
              
              Text(
                'Bienvenido',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                    ),
              ),
              Text('Municipalidad de Urubamba',
                  style: TextStyle(color: Colors.white, fontSize: 19.0)),
            ],
          ),
        ),
      );
    });
  }

  //rotacion de container
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
    _controller!.forward(); //forward();//repeat()
    super.initState();
    setState(() {});
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  //Aqui declaramos la lista de imagenes para llamarlas directamente
  List images = [
    'assets/images/municipalidad/1.png',
    'assets/images/municipalidad/2.png',
    'assets/images/municipalidad/3.png',
    'assets/images/municipalidad/4.png',
    'assets/images/municipalidad/5.png',
    'assets/images/municipalidad/6.png'
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          //fondo de pantalla drawer: pagina ocualta 
          FondoPantalla1(),
          //barra de navegacion de menu: pagina ocualta 
          SingleChildScrollView(
            child: SafeArea(
              child: Container(
                width:width*.56,
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () => _updateState(),
                              //sol
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: _decoration(),
                                child: AnimatedBuilder(
                                  animation: _controller!.view,
                                  builder: (context, child) {
                                    return Transform.rotate(
                                      angle: _controller!.value * 15 * pi,
                                      child: child,
                                    );
                                  },
                                ),
                              ),
                            ),
                            
                            AnimatedContainer(
                              duration: const Duration(seconds: 3),
                              curve: Curves.bounceOut,
                              width: double.maxFinite,
                              height: _height,
                              color: colors,
                              child: _columna,
                            ),
                          ],
                        ),
                        //puntos de slider
                        Container(        
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.5),
                            borderRadius:
                                BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Labore fugiat elit officia tempor consectetur excepteur nisi exercitation minim deserunt commodo. Anim nisi dolor consequat cupidatat qui amet adipisicing sint eu dolor cillum. In adipisicing proident voluptate nisi deserunt cupidatat laboris laboris ut est veniam. Sint dolor laborum sint occaecat excepteur esse.",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                            maxLines: 20,
                          ),
                        ),
                      ],
                    ),
                    // Expanded(
                    //   child: ListView(
                    //     children: <Widget>[
                    //       ListTile(
                    //         onTap: () {
                    //           Navigator.pushNamed(context, 'myapp');
                    //         },
                    //         leading: const Icon(
                    //           Icons.home,
                    //           color: Colors.white,
                    //         ),
                    //         title: const Text(
                    //           "Home",
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    //pegado
                  ],
                ),
              ),
            ),
          ),
          //pagina sobrepuesta
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
            builder: (_, double val, __) {
              return Transform(
                alignment: Alignment.center,
                transform: (Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi / 6) * val)),

                //hoja deslizable

                child: Scaffold(
                  body: PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: images.length,
                      itemBuilder: (_, index) {
                        return Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  //assets/img/${imagenes[index]}${imagenes[index]}
                                  images[index]),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 150),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(5, (indexSlider) {
                                return Container(
                                  width: 8,
                                  margin: const EdgeInsets.only(bottom: 2),
                                  height: index == indexSlider ? 25 : 8,
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromARGB(210, 233, 98, 98),
                                        spreadRadius: 2,
                                        blurRadius: 80,
                                        offset: Offset(10, 10),
                                      )
                                    ],
                                   
                                    borderRadius: BorderRadius.circular(20),
                                    color: index  == indexSlider 
                                        ? const Color.fromARGB(
                                            255, 246, 249, 51)
                                        : const Color.fromARGB(
                                                255, 237, 38, 108)
                                            .withOpacity(0.8),
                                  ),
                                );
                              }),
                            ),
                          ),
                        );
                      }),
                ),
              );
            },
          ),
          GestureDetector(onHorizontalDragUpdate: (e) {
            if (e.delta.dx > 0) {
              setState(() {
                value = 1;
              });
            } else {
              setState(() {
                value = 0;
              });
            }
          }),
        ],
      ),
    );
  }

  BoxDecoration _decoration() {
    return const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(212, 255, 242, 55),
            spreadRadius: 20,
            blurRadius: 50,
            offset: Offset(10, 12),
          )
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://cdn-icons-png.flaticon.com/512/1004/1004611.png'),
        ));
  }
}

class FondoPantalla1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://i.pinimg.com/474x/c8/ba/e0/c8bae00187b5b49c5c1bf4e97dc74155.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
