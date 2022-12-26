import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:turismo/Model/distrito_models.dart';
import 'package:turismo/Provider/distrito_provider.dart';
import 'package:turismo/prueba.dart';

const LatLng currentLocation = LatLng(-13.163037, -72.544738);

class MapsPage extends StatefulWidget {
   MapsPage({super.key, required this.data});
  Distrito data;
  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  late GoogleMapController mapController;
  Map<String, Marker> _maprkers = {};
  @override
  Widget build(BuildContext context) {
    final distritoProvider =
        Provider.of<DistritoProvider>(context, listen: true);
    final List<Distrito> distrito = distritoProvider.distritoList;
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition:
                CameraPosition(target: currentLocation, zoom: 8.5),
            onMapCreated: (controller) {
              mapController = controller;
              addMarker('test', LatLng(widget.data.latitud, widget.data.longitud));//currentLocation
            },
            markers: _maprkers.values.toSet(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...distrito.map((e) => Container(
                    margin: EdgeInsets.only(left: 10,right: 10,top: 70),
                    padding: EdgeInsets.all(20),
                    //width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 41, 220, 196).withOpacity(.8),
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(e.imagen)
                      )
                    ),

                    child: Text(e.title.toUpperCase(),style: TextStyle(color: Colors.white),),
                  ),)
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  addMarker(String id, LatLng location) async {
    var markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(50, 50)), 'assets/icon.png');
    var url = 'https://media4.giphy.com/media/U3OR7whzGbVEpMf7LY/giphy.gif';
    var bytes = (await NetworkAssetBundle(Uri.parse(url)).load(url))
        .buffer
        .asUint8List();

    var marker = Marker(
        markerId: MarkerId(id),
        position: location,
        infoWindow: InfoWindow(
          title: '${widget.data.title} Restaurants',
          snippet:
              '1).${widget.data.restaurant1}\n2).${widget.data.restaurant2}\n3).Hotel:${widget.data.hotel1}',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        // icon: markerIcon
        icon: BitmapDescriptor.fromBytes(bytes));

    _maprkers[id] = marker;
    setState(() {});
  }
}
