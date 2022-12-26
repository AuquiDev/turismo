
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:turismo/Pages/home_page.dart';
import 'package:turismo/Provider/danza_provider.dart';
import 'package:turismo/Provider/distrito_provider.dart';
import 'package:turismo/Provider/recursos_provider.dart';
import 'package:turismo/clima%20servis/pages/home_pages.dart';
import 'package:turismo/mapspage.dart';
// import 'package:turismo/Pages/home_page.dart';

void main() => runApp( AppState());//cambio .....

class AppState extends StatelessWidget {
//AIzaSyBwC5KliLCm3dZeDLSyP3TTnuQ8K63fFS0  API MAP
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_){
            return DistritoProvider();
          }
          ),
         ChangeNotifierProvider(
          lazy: false,
          create: (_){
            return RecursosProvider();
          }
          ),
        ChangeNotifierProvider(
          lazy: false,
          create: (_){
            return DanzaProvider();
          }),
      ],
      child: MyApp(),
    );
  }
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Urubamba guia',
      home: HomePage(),
      theme:ThemeData(     
        textTheme: GoogleFonts.firaSansExtraCondensedTextTheme()
      ) ,     
    );
  }
}