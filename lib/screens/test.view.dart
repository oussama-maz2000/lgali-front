import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TestMap extends StatelessWidget {
  const TestMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          elevation: 3,
          child: Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: GoogleMap(

              initialCameraPosition:
                  CameraPosition(target: LatLng(35.537096, 6.109608), zoom: 15),
            ),
          ),
        ),
      ),
    );
  }
}
