
import 'package:flutter/material.dart';
import 'package:turismo/Provider/distrito_provider.dart';
import 'package:turismo/Provider/recursos_provider.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key,
  // required this.distrito
  });

  @override
  Widget build(BuildContext context) {
 //distrito
 final distritoProvider = Provider.of<DistritoProvider>(context, listen: true);
 print(distritoProvider.distritoList);
 //recursos 
 final recursoprovider = Provider.of<RecursosProvider>(context,listen: true);
    return Scaffold(
    
      body: Container(
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [        
             ...List.generate(distritoProvider.distritoList.length, (index) => Text(distritoProvider.distritoList[index].title)),
              const SizedBox(height: 50,),
              //Mapear eleemntos
              ...recursoprovider.recursoList.map((e) => Text(e.name)).toList()
           

           //Text(recursoprovider.recursoList[0].name)
          ],
        ),
      ),
    );
  }
}