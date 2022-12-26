import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> name = [];

  @override
  void initState() {
    super.initState();
    getData().then((value) {
      name = value;
      setState(() {});
    });
  }

  Future<void> fetchFataFinal() async{
    name = await getData();
    setState(() {  });
  }


  Future <List<String>> getData ()async {
    return Future.delayed(const Duration(seconds: 5),(){
      return ['Eduardo','Cristian', 'Jaime', 'Rolando','Luis'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
//la ventaja de este future es que por defecto cambia los valores sin nesecidad de un setState
        future: getData(),//que future quieres gestionar
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<String> _names = snapshot.data!;
            return ListView.builder(       
              itemCount:_names.length ,
              itemBuilder:(context,index){
                return ListTile(
                  title: Text(_names[index]),
                );
              }
              );
          }
          else{
            return const Center(child: CircularProgressIndicator());
          }
          
         } ,
        )
      
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     ElevatedButton(
      //       onPressed: () async {
      //        fetchFataFinal();
      //       }, 
      //       child: Text('Obtener Data')),
      //       //obtener una lista 
      //     ...List.generate(name.length, (index) => Text(name[index])),
      //       const SizedBox(height: 50,),
      //     //Mapear eleemntos
      //     ...name.map((e) => Text(e)).toList(),


      //   ],
      // ),
    );
  }
}
