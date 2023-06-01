import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
class ConvertLatLan extends StatefulWidget {
  const ConvertLatLan({Key? key}) : super(key: key);

  @override
  State<ConvertLatLan> createState() => _ConvertLatLanState();
}

class _ConvertLatLanState extends State<ConvertLatLan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: ()async{
              print("im in gesture dectector");
              final coordinates= new Coordinates(30.3165, 78.0322);
              var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
              var first = address.first;
              print("address:"+first.featureName.toString()+first.addressLine.toString());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Center(
                  child: Text('Convert'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
