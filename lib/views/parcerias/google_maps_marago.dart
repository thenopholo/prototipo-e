import 'dart:async';
import 'package:eveo_app/utils/colors.dart';
import 'package:eveo_app/utils/google_map_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class ParceiroMapsPage extends StatefulWidget {
  const ParceiroMapsPage({super.key});

  @override
  State<ParceiroMapsPage> createState() => ParceiroMapsPageState();
}

class ParceiroMapsPageState extends State<ParceiroMapsPage> {
  final Completer<GoogleMapController> controller = Completer();
  final Uri _url = Uri.parse(
      'https://www.google.com/maps/place/Marag%C3%B4+Rest%C3%B4+Bar+-+Brooklin/@-23.624172,-46.6984096,17z/data=!3m1!4b1!4m6!3m5!1s0x94ce51ee257cf49f:0x769a043eb214fca4!8m2!3d-23.6241769!4d-46.6958347!16s%2Fg%2F11j_1lhmd9?entry=ttu');

  static const LatLng sourceLocation = LatLng(-23.6231, -46.6955);
  static const LatLng destination = LatLng(-23.6242, -46.6958);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  Future<void> _abrirGoogleMaps(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );
  }

  void getPolyPoint() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleMapsApiKey,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    getPolyPoint();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Maragô Restrô Bar",
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: cinza,
          ),
        ),
      ),
      body: Stack(
        children: [
          currentLocation == null
              ? const Center(child: Text("Carregando..."))
              : GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target:
                        sourceLocation, //LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                    zoom: 14.5,
                  ),
                  polylines: {
                    Polyline(
                      polylineId: const PolylineId("route"),
                      points: polylineCoordinates,
                      color: Colors.blue.shade600,
                      width: 6,
                    )
                  },
                  markers: {
                    Marker(
                      markerId: const MarkerId('currentLocation'),
                      position: LatLng(
                        currentLocation!.latitude!,
                        currentLocation!.longitude!,
                      ),
                    ),
                    const Marker(
                      markerId: MarkerId('source'),
                      position: sourceLocation,
                    ),
                    const Marker(
                      markerId: MarkerId('destination'),
                      position: destination,
                    ),
                  },
                ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              height: 200,
              width: 400,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.5,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      children: [
                        Image.network(
                          'https://www.eveo.com.br/wp-content/uploads/2023/11/marago.jpg',
                          height: 200,
                          width: 150,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Maragô Restô Bar',
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: cinza,
                                ),
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: Icon(Ionicons.location_outline,
                                        color: vermelho),
                                  ),
                                  Text(
                                    '120m | 2min a pé',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: cinza,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: Icon(Ionicons.time_outline,
                                        color: vermelho),
                                  ),
                                  Text(
                                    '07:00 - 23:00',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: cinza,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _abrirGoogleMaps(_url);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: vermelho,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  'Me leve até lá',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
