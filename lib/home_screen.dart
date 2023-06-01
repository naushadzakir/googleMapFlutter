import 'dart:async';
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Completer<GoogleMapController> _controller=Completer();
  static final CameraPosition _kGooglePlex= const CameraPosition(
    target: LatLng(28.644800, 77.216721),
    zoom: 9,
  );

  List<Marker> _marker=[];
  final List<Marker> _list= const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(28.644800, 77.216721),
        infoWindow: InfoWindow(
            title: "My Current Location"
        )
    ),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(28.744803, 77.616722),
        infoWindow: InfoWindow(
          title: "My Second Location",
        )
    ),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(28.844803, 77.616722),
      infoWindow: InfoWindow(
        title: "this is third location",
      ),
    ),
    Marker(
        markerId: MarkerId('3'),
        position: LatLng(28.844803, 77.716722),
        infoWindow:InfoWindow(
            title: 'this is forth location'
        )
    )
  ];


  @override
  void initState(){

    //to implement the initState
    super.initState();
    _marker.addAll(_list);
  }





  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          markers: Set<Marker>.of(_marker),
          compassEnabled: false,
          myLocationButtonEnabled: true,
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(
          Icons.location_disabled,
        ),
        onPressed: ()async{
          GoogleMapController controller= await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target:LatLng(28.744803, 77.616722),
              zoom: 15,
          )));
        },
      ),
    );
  }
}
