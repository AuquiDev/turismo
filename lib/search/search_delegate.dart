


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turismo/Model/distrito_models.dart';
import 'package:turismo/Model/restaurant_models.dart';
import 'package:turismo/Pages/distrito_page.dart';
import 'package:turismo/Provider/distrito_provider.dart';

class productSearchDelegate  extends SearchDelegate{

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar distrito';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: (){
          query = '';
        }, 
        icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return 
      IconButton(
        onPressed: (){
          close(context, null);
        }, 
        icon: Icon(Icons.arrow_back)
        );
  }

  @override
  Widget buildResults(BuildContext context) {
    return 
      Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        child: Center(
          child: Icon(Icons.search, color: Colors.black,size: 120,),
        ),
      );
    }
    final providerSeach = Provider.of<DistritoProvider> (context);
    return FutureBuilder(
      future: providerSeach.searchProducto(query),
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot<List<Distrito>> snapshot) {
       if(!snapshot.hasData){
        return Container(
        child: Center(
          child: Icon(Icons.search, color: Colors.black,size: 120,),
        ),
      );
       }
       final productosData = snapshot.data!;
        return  ListView.builder(
          itemCount: productosData.length,
          itemBuilder: (context, index){
            return _Productos(productResult: productosData[index]);
          },
        );
      },
    );
  }


}
//restaurant
class _Productos extends StatelessWidget {
   _Productos({required this.productResult});
  final Distrito productResult;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(
        
        image: NetworkImage(productResult.imagen),
        width: 50,
        fit:BoxFit.contain,
      ),
      title: Text(productResult.title),
      subtitle: Text(productResult.descripcion),
      onTap: (){
        print(productResult.title);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DistritoPage(data: productResult,)));
      },
    );
  }
}



class RestaurantSearchDelegate  extends SearchDelegate{

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar restaurant';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: (){
          query = '';
        }, 
        icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return 
      IconButton(
        onPressed: (){
          close(context, null);
        }, 
        icon: Icon(Icons.arrow_back)
        );
  }

  @override
  Widget buildResults(BuildContext context) {
    return 
      Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        child: Center(
          child: Icon(Icons.search, color: Colors.black,size: 120,),
        ),
      );
    }
    final providerSeach = Provider.of<DistritoProvider> (context);
    return FutureBuilder(
      future: providerSeach.searchRestaurant(query),
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot<List<Restaurant>> snapshot) {
       if(!snapshot.hasData){
        return Container(
        child: Center(
          child: Icon(Icons.search, color: Colors.black,size: 120,),
        ),
      );
       }
       final productosData = snapshot.data!;
        return  ListView.builder(
          itemCount: productosData.length,
          itemBuilder: (context, index){
            return _Restaurant(productResult: productosData[index]);
          },
        );
      },
    );
  }


}

class _Restaurant extends StatelessWidget {
   _Restaurant({required this.productResult});
  final Restaurant productResult;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(
        
        image: NetworkImage(productResult.image),
        width: 50,
        fit:BoxFit.contain,
      ),
      title: Text(productResult.nombre),
      subtitle: Column(
        children: [
          Text(productResult.descripcion),
          Divider(),
          Text(productResult.telefono),
           Divider(),
          Text(productResult.ubicacion),
           Divider(),
          Text(productResult.atencion),
        ],
      ),
      onTap: (){
        print(productResult.atencion);
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> DistritoPage(data: productResult,)));
      },
    );
  }
}

