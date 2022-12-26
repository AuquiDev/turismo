import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:turismo/prueba.dart';

class ClimaPage extends StatefulWidget {
  @override
  State<ClimaPage> createState() => _ClimaPageState();
}

class _ClimaPageState extends State<ClimaPage> {
  final _formKey = GlobalKey<FormState>();

  String cityName = '';

  String country = '';

  double temp = 0;

  bool isloading = true;

  final TextEditingController _seachController = TextEditingController();

  @override
  initState() {
    super.initState();
    getData('Urubamba'); //cuando el aplicativo inicie llame a get data location
    //getDatLocation();
  }

  getData(String city) async {
    isloading = true;
    setState(() {});
    Uri _url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=7c754f031b87b83b71da3437f2fc99c4');
    http.Response response = await http.get(_url);
    // print(response.statusCode);
    // print(response.body);

    //statucode = 200: si solo sale bien que ejecute esto
    if (response.statusCode == 200) {
      Map myMap = (json.decode(response.body));
      temp = myMap['main']['temp'];
      temp = temp - 273.15;
      cityName = myMap['name'];
      country = myMap['sys']['country'];
      isloading = false;
      setState(() {});
    }
  }

  getDatLocation() async {
    //Permisos de geolocalizacion IOS
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    /*_____________*/
    isloading = true;
    setState(() {});

    Position position =
        await Geolocator.getCurrentPosition(); //obtener la posicion actual
    // print(position);
    // print(position.latitude);
    // print(position.longitude);
    // print(position.altitude);

    Uri _url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=7c754f031b87b83b71da3437f2fc99c4');
    http.Response response = await http.get(_url);
    if (response.statusCode == 200) {
      Map myMap = (json.decode(response.body));
      temp = myMap['main']['temp'];
      temp = temp - 273.15;
      cityName = myMap['name'];
      country = myMap['sys']['country'];
      isloading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(177, 237, 175, 212),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Divider(),
                    const Text(
                      'Consultar Clima',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                    ),
                    IconButton(
                        onPressed: () {
                          getDatLocation();
                        },
                        icon: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 40,
                        )),

                    // Image.asset(
                    //   'assets/images/dom.png',
                    //   height: 60,
                    //   color: Colors.white,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${temp.toStringAsFixed(1)}',
                          style: const TextStyle(
                              fontSize: 75,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text('ºC',
                            style: TextStyle(fontSize: 18, color: Colors.red)),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$cityName, $country',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 6, 6, 6),
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _seachController,
                      validator: (value) {
                        if (value != null) {
                          return 'este compo es requerido';
                        }
                        if (value != cityName || value != country) {
                          return 'nombre incorrecto';
                        } else {
                          return '';
                        }
                      },
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          hintText: 'Ingresa una ciudad',
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(135, 131, 78, 78),
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor:
                              const Color.fromARGB(255, 15, 15, 15).withOpacity(.1),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide.none)),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xfffe6c6d),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14))),
                          onPressed: () {
                            String city = _seachController.text;
                            getData(city);
                            if (city == '') {
                              isloading = false;
                              if (_formKey.currentState!.validate()) {}
                              setState(() {});
                            }
                          },
                          child: const Text(
                            'Buscar',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            isloading
                ? Container(
                    color: const Color(0xff232535).withOpacity(0.98),
                    child: const Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Color(0xffFE6C6D),
                          strokeWidth: 1.5,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        
    );
  }

  TextStyle _style() => const TextStyle(color: Colors.white);
}
