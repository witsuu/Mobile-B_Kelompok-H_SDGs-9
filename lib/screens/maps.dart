import 'dart:math' as mathdart;
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart' as mb;
import 'package:geolocator/geolocator.dart' as geo;

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var token =
      'pk.eyJ1IjoiYXppemFobiIsImEiOiJja2pvbDkzdWEyeWNnMnFvN2ZhMm9lOXl1In0.htL6ELgwBTPahY-qVa9CyQ';

  mb.MapboxMapController mapController;
  dynamic gpsLoc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(title: Text('Map Screen')),
      body: Center(
        child: Column(
          children: [
            buildMap(),
            //buildBtnBottomRow(),
          ],
        ),
      ),
    );
  }

  Widget buildMap() {
    return Container(
      height: 400,
      child: mb.MapboxMap(
        accessToken: token,
        styleString: 'mapbox://styles/mapbox/streets-v11',
        initialCameraPosition: new mb.CameraPosition(
            target: mb.LatLng(-7.9424931, 112.9355026), zoom: 8),
        onMapCreated: mapCreated,
        onMapClick: mapClicked,
      ),
    );
  }

  void mapClicked(mathdart.Point<double> point, mb.LatLng latLng) {
    if (mapController != null) {
      mapController.addCircle(new mb.CircleOptions(
        circleRadius: 8,
        circleColor: 'red',
        circleOpacity: 1,
        geometry: latLng,
        draggable: false,
      ));
    }
  }

  void mapCreated(mb.MapboxMapController controller) {
    mapController = controller;
    print('map created');

    var lokasi = mb.LatLng(-7.9424931, 112.9355026);

    mapController.addCircle(new mb.CircleOptions(
      circleRadius: 8,
      circleColor: 'blue',
      circleOpacity: 1,
      geometry: lokasi,
      draggable: false,
    ));

    checkPermissionGps();
  }

  void mapCLicked(mathdart.Point<double> point, mb.LatLng latLng) {
    if (mapController != null) {
      mapController.addCircle(new mb.CircleOptions(
        circleRadius: 8,
        circleColor: 'red',
        circleOpacity: 1,
        geometry: latLng,
        draggable: false,
      ));
    }
  }

  void checkPermissionGps() async {
    print("CHECKING LOCATION BEGIN");
    geo.Geolocator.isLocationServiceEnabled().then((bool isEnable) {
      print("LOATION SERVICE ENABLE? : $isEnable");
      if (isEnable == false) {
        msgLocError("Layanan Lokasi tidak tersedia");
      } else {
        geo.Geolocator.checkPermission().then((geo.LocationPermission locPerm) {
          if (locPerm == geo.LocationPermission.deniedForever) {
          } else if (locPerm == geo.LocationPermission.denied) {
            geo.Geolocator.requestPermission()
                .then((geo.LocationPermission permRes) {
              if (permRes == geo.LocationPermission.whileInUse ||
                  permRes == geo.LocationPermission.always) {
                getCurrentLoc();
              } else {
                msgLocError('User tidak memberikan permission');
              }
            });
          } else {
            getCurrentLoc();
          }
        });
      }
    });
  }

  void getCurrentLoc() async {
    geo.Geolocator.getCurrentPosition().then((geo.Position pos) {
      print('GPS LOCATION: ${pos.latitude} ${pos.longitude}');
      if (mapController != null) {
        gpsLoc = new mb.LatLng(pos.latitude, pos.longitude);
        var newCamLoc = mb.CameraUpdate.newLatLng(gpsLoc);
        mapController.animateCamera(newCamLoc);
        mapController.addCircle(new mb.CircleOptions(
          geometry: gpsLoc,
          circleColor: 'yellow',
          circleStrokeColor: 'black',
          circleStrokeWidth: 1,
          circleRadius: 10,
          draggable: false,
        ));
      }
    });
  }

  void msgLocError(_content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("$_content"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"))
            ],
          );
        });
  }
}
