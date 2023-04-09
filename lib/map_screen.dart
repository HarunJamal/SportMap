import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'booking_menu.dart';

User? loggedinUser;

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Google Maps Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  Completer<GoogleMapController> _controller = Completer();

  void initState() {
    super.initState();
    getCurrentUser();
  }

  //using this function you can use the credentials of the user
  void getCurrentUser() async {
    try {
      // ignore: await_only_futures
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  static final CameraPosition _kErnakulam = CameraPosition(
    target: LatLng(9.9876768, 76.2868346),
    zoom: 11.80,
  );

  static final Marker _kUSCMarker = Marker(
    markerId: MarkerId('_kUSC'),
    infoWindow: InfoWindow(title: 'United Sports Center'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(10.0037896, 76.3605003),
  );

  static final Marker _kOAFTMarker = Marker(
    markerId: MarkerId('_kOlympusArena'),
    infoWindow: InfoWindow(title: 'Olympus Arena Football Turf'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(9.9861848, 76.3013059),
  );

  static final Marker _kSHMarker = Marker(
    markerId: MarkerId('_kSporthood'),
    infoWindow: InfoWindow(title: 'Sporthood Soccer Park'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(10.006457, 76.3344884),
  );

  static final Marker _kA57Marker = Marker(
    markerId: MarkerId('_kArena57'),
    infoWindow: InfoWindow(title: 'Arena 57'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(10.0231242, 76.346452),
  );

  static final Marker _kGFSMarker = Marker(
    markerId: MarkerId('_kGreenfieldSports'),
    infoWindow: InfoWindow(title: 'Greenfield Sports'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(10.0259265, 76.3410007),
  );

  static final Marker _kF12AMarker = Marker(
    markerId: MarkerId('_kF12Arena'),
    infoWindow: InfoWindow(title: 'F12 Arena Football Turf'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(10.0254361, 76.3609212),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);

                //Implement logout functionality
              }),
        ],
        title: Center(child: Text('Home Page')),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        markers: {
          _kUSCMarker,
          _kOAFTMarker,
          _kSHMarker,
          _kA57Marker,
          _kGFSMarker,
          _kF12AMarker
        },
        initialCameraPosition: _kErnakulam,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pushNamed("booking_menu");
        },
        label: Text('Book Reservation'),
        icon: Icon(Icons.access_time),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
