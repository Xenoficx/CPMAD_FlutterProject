import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_app_2/screens/about_page.dart';

class MapPage extends StatefulWidget {
  

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  Completer<GoogleMapController> _controller = Completer();

  BitmapDescriptor _locIcon;
  final Set<Marker> listMarkers = {};

  Future<BitmapDescriptor> _setLocCustomMarker() async {
    BitmapDescriptor bIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5), 'assets/images/home-map-pin.png');

    return bIcon;
  }

  @override
  void initState(){
    super.initState();

    _setLocCustomMarker().then((value){
      _locIcon = value;
      _locIcon != null ? setState((){
        listMarkers.add(Marker(
          markerId: MarkerId('1'),
          position: LatLng(1.3377178076865808, 103.64210558772653),
          infoWindow: InfoWindow(title: 'Our Location'),
          icon: _locIcon
        ));
      }) : DoNothingAction();
    });
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition _currentPos = CameraPosition(
      bearing: 0.0,
      target: LatLng(1.3377178076865808, 103.64210558772653),
      tilt: 60.0,
      zoom: 17
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          iconSize: 60.0,
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: () {
            Get.to(()=>AboutPage());
          },
        ),
      ),
      body: GoogleMap(
        markers: Set.from(listMarkers),
        myLocationButtonEnabled: true,
        initialCameraPosition: _currentPos,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),
    );
  }
}