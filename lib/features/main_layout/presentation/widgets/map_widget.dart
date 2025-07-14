import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class LocationPickerScreen extends StatefulWidget {
  @override
  _LocationPickerScreenState createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  GoogleMapController? _mapController;
  LatLng? _currentLocation;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getPermissionAndLocation();
  }

  Future<void> _getPermissionAndLocation() async {
    try {
      // إضافة timeout للعمليات
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled()
          .timeout(Duration(seconds: 10));

      if (!serviceEnabled) {
        setState(() {
          _isLoading = false;
        });
        // عرض dialog بدلاً من فتح الإعدادات مباشرة
        _showLocationServiceDialog();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission()
          .timeout(Duration(seconds: 5));

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission()
            .timeout(Duration(seconds: 10));
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _isLoading = false;
        });
        _showPermissionDialog();
        return;
      }

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium, // غير من high إلى medium
          timeLimit: Duration(seconds: 10), // إضافة timeout
        );

        if (mounted) { // تأكد أن الـ widget لسه موجود
          setState(() {
            _currentLocation = LatLng(position.latitude, position.longitude);
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      print("Error getting location: $e");
      if (mounted) {
        setState(() {
          _isLoading = false;
          // استخدم موقع افتراضي في حالة الخطأ
          _currentLocation = LatLng(30.0444, 31.2357); // القاهرة
        });
      }
    }
  }

  void _showLocationServiceDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Location Services Disabled'),
        content: Text('Please enable location services to use this feature.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Geolocator.openLocationSettings();
            },
            child: Text('Settings'),
          ),
        ],
      ),
    );
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Location Permission Required'),
        content: Text('Please grant location permission in app settings.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Geolocator.openAppSettings();
            },
            child: Text('Settings'),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick Location')),
      body: _isLoading
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Getting your location...'),
          ],
        ),
      )
          : _currentLocation == null
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_off, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text("Unable to fetch location"),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _getPermissionAndLocation,
              child: Text("Try Again"),
            ),
          ],
        ),
      )
          : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _currentLocation!,
          zoom: 15,
        ),
        onMapCreated: (controller) {
          _mapController = controller;
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onTap: (LatLng latLng) {
          setState(() {
            _currentLocation = latLng;
          });
        },
        markers: {
          Marker(
            markerId: MarkerId("selected_location"),
            position: _currentLocation!,
            draggable: true,
            onDragEnd: (newPosition) {
              setState(() {
                _currentLocation = newPosition;
              });
            },
          )
        },
      ),
      bottomNavigationBar: _currentLocation != null
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context, _currentLocation),
          child: Text("Confirm Location"),
        ),
      )
          : null,
    );
  }
}
