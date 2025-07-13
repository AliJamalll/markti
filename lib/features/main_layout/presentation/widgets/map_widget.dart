import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class LocationPickerScreen extends StatefulWidget {
  @override
  _LocationPickerScreenState createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  GoogleMapController? mapController;
  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    _getPermissionAndLocation();
  }

  Future<void> _getPermissionAndLocation() async {
    // Check and request location permissions
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      // Permission denied forever, open settings
      await Geolocator.openAppSettings();
      return;
    }

    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        currentLocation = LatLng(position.latitude, position.longitude);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Location permission denied")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Your Location')),
      body: currentLocation == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: currentLocation!,
          zoom: 15,
        ),
        onMapCreated: (controller) {
          mapController = controller;
        },
        myLocationEnabled: true,
        markers: {
          Marker(
            markerId: MarkerId("current_location"),
            position: currentLocation!,
            infoWindow: InfoWindow(title: "Your Location"),
            draggable: true,
            onDragEnd: (newPosition) {
              setState(() {
                currentLocation = newPosition;
              });
            },
          ),
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            print("Selected location: ${currentLocation?.latitude}, ${currentLocation?.longitude}");
            // Send location to server or store it
          },
          child: Text("Confirm Location"),
        ),
      ),
    );
  }
}
