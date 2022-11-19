import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import 'package:homila_ai/HomeScreen.dart';
import 'package:homila_ai/text.dart';


class Location extends StatelessWidget {
  String name;
  String address;
  String phoneNum;
  double latitude;
  double longitude;
  double myLocationLatitude;
  double myLocationLongitude;
  double ScreenWidth;
  double ScreenHeight;
  double FontSizeScale;
  bool divider = true;

  Location({
    Key ? key,
    required this.name,
    required this.address,
    required this.phoneNum,
    required this.latitude,
    required this.longitude,
    required this.myLocationLatitude,
    required this.myLocationLongitude,
    required this.ScreenWidth,
    required this.ScreenHeight,
    required this.FontSizeScale,
  }) : super(key: key);

  double getDistanceMeter () {

    // return Geolocator.distanceBetween(myLocationLatitude, myLocationLongitude, latitude, longitude);

    double R = 6373000;

    double latitudeRad = latitude * math.pi/180;
    double longitudeRad = longitude * math.pi/180;

    double myLocationLatitudeRad = myLocationLatitude * math.pi/180;
    double myLocationLongitudeRad = myLocationLongitude * math.pi/180;

    double dLat = myLocationLatitudeRad - latitudeRad;
    double dLon = myLocationLongitudeRad - longitudeRad;

    double a = math.pow(math.sin(dLat), 2) + math.cos(latitudeRad) * math.cos(longitudeRad) * math.pow(math.sin(dLon), 2);
    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1-a));

    return R * c;
  }

  @override
  Widget build(BuildContext context) {
    double distanceMeter = getDistanceMeter();
    // double distanceMeter = Geolocator.distanceBetween(myLocationLatitude, myLocationLongitude, latitude, longitude);

    String distanceString = distanceMeter < 1000 ?
    "${distanceMeter.round()} ${Words[Lang]!['m']!}" :
    "${(distanceMeter/1000).toStringAsFixed(2)} ${Words[Lang]!['km']!}";

    return Container(
        height: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                // Адрес и конттакты
                SizedBox(
                  width: ScreenWidth*0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      // Название
                      Text(
                        name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20/FontSizeScale
                        ),
                      ),

                      // Адрес
                      Text(
                        address,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20/FontSizeScale
                        ),
                      ),

                      // Тел.номер
                      ElevatedButton.icon(
                          onPressed: () async{
                            launchUrl(Uri.parse("tel://$phoneNum"));
                          },
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(20),
                            // padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                            backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent),
                          ),
                          icon: Icon(
                            Icons.local_phone_sharp,
                            color: Colors.black,
                            size: 20/FontSizeScale,
                          ),
                          label: Text(
                            phoneNum,
                            style: TextStyle(
                                fontSize: 20/FontSizeScale,
                                color: Colors.black
                            ),
                          )
                      ),
                    ],
                  ),
                ),

                // Кнопка для перехода на карту
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(ScreenWidth/5, ScreenWidth/5),
                        elevation: 20,
                        backgroundColor: Colors.yellowAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(ScreenWidth/10)
                        )
                    ),

                    onPressed: () async{

                      // String URL = "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
                      // await launchUrl(Uri.parse(URL));

                      launchUrl(
                        Uri.parse("geo:$latitude,$longitude"),
                        // Uri.parse("https://www.google.com/maps/search/?api=1&query=$latitude,$longitude"),
                        // Uri.parse("https://yandex.uz/maps/10335/tashkent/house/YkAYdQRhQUcGQFprfX90cnVlYA==/?ll=$latitude%2C$longitude&z=18.79"),
                        // mode: LaunchMode.externalApplication,
                        mode: LaunchMode.externalNonBrowserApplication
                      );

                    },

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.red,
                        ),
                        Text(
                          Words[Lang]!["Map"]!,
                          style: TextStyle(
                              color: Colors.red
                          ),
                        )
                      ],
                    )
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${Words[Lang]!['Distance']!}:  ",
                  style: TextStyle(
                      fontSize: 20/FontSizeScale,
                      color: Colors.red
                  ),
                ),
                Text(
                  distanceString,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20/FontSizeScale,
                      color: Colors.red
                  ),
                ),
              ],
            ),

            // Divider:
            if(divider) Divider(
              thickness: 1,
              color: Colors.black,
            ),
          ],
        )
    );
  }
}




class LocationsScreen extends StatefulWidget {
  @override
  _LocationsScreenState createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {

  @override
  Widget build(BuildContext context) {

    final args = (ModalRoute.of(context)?.settings.arguments ?? <double>[]) as List;

    double myLocationLatitude = args[0];
    double myLocationLongitude = args[1];

    // getMyCurrentLocation();

    double FontSizeScale = MediaQuery.of(context).textScaleFactor;
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.height;

    List<Location> Locations = [
      // Городской перинатальный центр №1
      Location(
        name: Words[Lang]!['locationName1']!,
        address: Words[Lang]!['locationAddress1']!,
        phoneNum : "+998712425762",
        latitude: 41.32123842399223,
        longitude: 69.2175144057339,
        myLocationLatitude: myLocationLatitude,
        myLocationLongitude: myLocationLongitude,
        ScreenWidth: ScreenWidth,
        ScreenHeight: ScreenHeight,
        FontSizeScale: FontSizeScale,
      ),

      // Республиканский перинатальный центр
      Location(
        name: Words[Lang]!['locationName2']!,
        address: Words[Lang]!['locationAddress2']!,
        phoneNum : "+998712602873",
        latitude: 41.36442164038283,
        longitude: 69.33519182798594,
        myLocationLatitude: myLocationLatitude,
        myLocationLongitude: myLocationLongitude,
        ScreenWidth: ScreenWidth,
        ScreenHeight: ScreenHeight,
        FontSizeScale: FontSizeScale,
      ),

      // Ташкентский областной перинатальный центр
      Location(
        name: Words[Lang]!['locationName3']!,
        address: Words[Lang]!['locationAddress3']!,
        phoneNum : "+998707129204",
        latitude: 41.4452823345087,
        longitude: 69.55616626352564,
        myLocationLatitude: myLocationLatitude,
        myLocationLongitude: myLocationLongitude,
        ScreenWidth: ScreenWidth,
        ScreenHeight: ScreenHeight,
        FontSizeScale: FontSizeScale,
      ),

      //Городской Перинатальный центр
      Location(
        name: Words[Lang]!['locationName4']!,
        address: Words[Lang]!['locationAddress4']!,
        phoneNum : "+998712429408",
        latitude: 41.321356,
        longitude: 69.217543,
        myLocationLatitude: myLocationLatitude,
        myLocationLongitude: myLocationLongitude,
        ScreenWidth: ScreenWidth,
        ScreenHeight: ScreenHeight,
        FontSizeScale: FontSizeScale,
      ),

      // Перинатальный центр Республики Каракалпакистан
      Location(
        name: Words[Lang]!['locationName5']!,
        address: Words[Lang]!['locationAddress5']!,
        phoneNum : "+998612240319",
        latitude: 42.467808671355726,
        longitude: 59.61721748257821,
        myLocationLatitude: myLocationLatitude,
        myLocationLongitude: myLocationLongitude,
        ScreenWidth: ScreenWidth,
        ScreenHeight: ScreenHeight,
        FontSizeScale: FontSizeScale,
      ),

      // Андижанский областной перинатальный центр
      Location(
        name: Words[Lang]!['locationName6']!,
        address: Words[Lang]!['locationAddress6']!,
        phoneNum : "+998979920085",
        latitude: 41.00166557993149,
        longitude: 72.25454733290063,
        myLocationLatitude: myLocationLatitude,
        myLocationLongitude: myLocationLongitude,
        ScreenWidth: ScreenWidth,
        ScreenHeight: ScreenHeight,
        FontSizeScale: FontSizeScale,
      ),

      //Бухарский областной перинатальный центр
      Location(
        name: Words[Lang]!['locationName7']!,
        address: Words[Lang]!['locationAddress7']!,
        phoneNum : "+998914128810",
        latitude: 39.74967460482171,
        longitude: 64.40364668463066,
        myLocationLatitude: myLocationLatitude,
        myLocationLongitude: myLocationLongitude,
        ScreenWidth: ScreenWidth,
        ScreenHeight: ScreenHeight,
        FontSizeScale: FontSizeScale,
      ),

      //Джизакский областной перинатальный центр
      Location(
        name: Words[Lang]!['locationName8']!,
        address: Words[Lang]!['locationAddress8']!,
        phoneNum : "+998952806970",
        latitude: 40.13447066484154,
        longitude: 67.8797934072932,
        myLocationLatitude: myLocationLatitude,
        myLocationLongitude: myLocationLongitude,
        ScreenWidth: ScreenWidth,
        ScreenHeight: ScreenHeight,
        FontSizeScale: FontSizeScale,
      ),

      //Навоийский областной перинатальный центр
      Location(
        name: Words[Lang]!['locationName9']!,
        address: Words[Lang]!['locationAddress9']!,
        phoneNum : "+998792204488",
        latitude: 39.76062846988888,
        longitude: 64.41146723920926,
        myLocationLatitude: myLocationLatitude,
        myLocationLongitude: myLocationLongitude,
        ScreenWidth: ScreenWidth,
        ScreenHeight: ScreenHeight,
        FontSizeScale: FontSizeScale,
      ),

      //Наманганский перинатальный центр
      Location(
        name: Words[Lang]!['locationName10']!,
        address: Words[Lang]!['locationAddress10']!,
        phoneNum : "+998692392571",
        latitude: 41.00492523120116,
        longitude: 71.7061814992722,
        myLocationLatitude: myLocationLatitude,
        myLocationLongitude: myLocationLongitude,
        ScreenWidth: ScreenWidth,
        ScreenHeight: ScreenHeight,
        FontSizeScale: FontSizeScale,
      ),

      //Самаркандский областной перинатальный центр
      Location(
        name: Words[Lang]!['locationName11']!,
        address: Words[Lang]!['locationAddress11']!,
        phoneNum : "+998915431183",
        latitude: 39.65539548045595,
        longitude: 66.91923521161371,
        myLocationLatitude: myLocationLatitude,
        myLocationLongitude: myLocationLongitude,
        ScreenWidth: ScreenWidth,
        ScreenHeight: ScreenHeight,
        FontSizeScale: FontSizeScale,
      ),

      //Сурхандарьинский областной перинатальный центр
      Location(
        name: Words[Lang]!['locationName12']!,
        address: Words[Lang]!['locationAddress12']!,
        phoneNum : "+998937935956",
        latitude: 37.261059604983494,
        longitude: 67.3086128408104,
        myLocationLatitude: myLocationLatitude,
        myLocationLongitude: myLocationLongitude,
        ScreenWidth: ScreenWidth,
        ScreenHeight: ScreenHeight,
        FontSizeScale: FontSizeScale,
      ),

      //Сырдарьинский областной перинатальный центр
      Location(
        name: Words[Lang]!['locationName13']!,
        address: Words[Lang]!['locationAddress13']!,
        phoneNum : "+998974947757",
        latitude: 41.12711823876792,
        longitude: 69.32060133183964,
        myLocationLatitude: myLocationLatitude,
        myLocationLongitude: myLocationLongitude,
        ScreenWidth: ScreenWidth,
        ScreenHeight: ScreenHeight,
        FontSizeScale: FontSizeScale,
      ),

      //Ферганский областной перинатальный центр
      Location(
        name: Words[Lang]!['locationName14']!,
        address: Words[Lang]!['locationAddress14']!,
        phoneNum : "+998732267341",
        latitude: 40.36916522769689,
        longitude: 71.7926703827937,
        myLocationLatitude: myLocationLatitude,
        myLocationLongitude: myLocationLongitude,
        ScreenWidth: ScreenWidth,
        ScreenHeight: ScreenHeight,
        FontSizeScale: FontSizeScale,
      ),

      //Хоремский областной перинатальный центр
      Location(
        name: Words[Lang]!['locationName15']!,
        address: Words[Lang]!['locationAddress15']!,
        phoneNum : "+998977928855",
        latitude: 41.53779426366273,
        longitude: 60.6321112558349,
        myLocationLatitude: myLocationLatitude,
        myLocationLongitude: myLocationLongitude,
        ScreenWidth: ScreenWidth,
        ScreenHeight: ScreenHeight,
        FontSizeScale: FontSizeScale,
      ),


      // Divider:
      // Divider(
      //   thickness: 1,
      //   color: Colors.black,
      // ),
      //
      // // Ташкентский областной перинатальный центр
      // Location(
      //     Words[Lang]!['locationName3']!,
      //     Words[Lang]!['locationAddress3']!,
      //     "+998707129204",
      //     41.4452823345087,
      //     69.55616626352564
      // ),
      //
      // //Divider:
      // Divider(
      //   thickness: 1,
      //   color: Colors.black,
      // ),
      //
      // //Городской Перинатальный центр
      // Location(
      //     Words[Lang]!['locationName4']!,
      //     Words[Lang]!['locationAddress4']!,
      //     "+998712429408",
      //     41.321356,
      //     69.217543
      // ),
      //
      // //Divider:
      // Divider(
      //   thickness: 1,
      //   color: Colors.black,
      // ),
      //
      // // Перинатальный центр Республики Каракалпакистан
      // Location(
      //     Words[Lang]!['locationName5']!,
      //     Words[Lang]!['locationAddress5']!,
      //     "+998612240319",
      //     42.467808671355726,
      //     59.61721748257821
      // ),
      //
      // //Divider:
      // Divider(
      //   thickness: 1,
      //   color: Colors.black,
      // ),
      //
      // // Андижанский областной перинатальный центр
      // Location(
      //     Words[Lang]!['locationName6']!,
      //     Words[Lang]!['locationAddress6']!,
      //     "+998979920085",
      //     41.00166557993149,
      //     72.25454733290063
      // ),
      //
      // //Divider:
      // Divider(
      //   thickness: 1,
      //   color: Colors.black,
      // ),
      //
      // //Бухарский областной перинатальный центр
      // Location(
      //     Words[Lang]!['locationName7']!,
      //     Words[Lang]!['locationAddress7']!,
      //     "+998914128810",
      //     39.74967460482171,
      //     64.40364668463066
      // ),
      //
      // //Divider:
      // Divider(
      //   thickness: 1,
      //   color: Colors.black,
      // ),
      //
      // //Джизакский областной перинатальный центр
      // Location(
      //     Words[Lang]!['locationName8']!,
      //     Words[Lang]!['locationAddress8']!,
      //     "+998952806970",
      //     40.13447066484154,
      //     67.8797934072932
      // ),
      //
      // //Divider:
      // Divider(
      //   thickness: 1,
      //   color: Colors.black,
      // ),
      //
      // //Навоийский областной перинатальный центр
      // Location(
      //     Words[Lang]!['locationName9']!,
      //     Words[Lang]!['locationAddress9']!,
      //     "+998792204488",
      //     39.76062846988888,
      //     64.41146723920926
      // ),
      //
      // //Divider:
      // Divider(
      //   thickness: 1,
      //   color: Colors.black,
      // ),
      //
      // //Наманганский перинатальный центр
      // Location(
      //     Words[Lang]!['locationName10']!,
      //     Words[Lang]!['locationAddress10']!,
      //     "+998692392571",
      //     41.00492523120116,
      //     71.7061814992722
      // ),
      //
      // //Divider:
      // Divider(
      //   thickness: 1,
      //   color: Colors.black,
      // ),
      //
      // //Самаркандский областной перинатальный центр
      // Location(
      //     Words[Lang]!['locationName11']!,
      //     Words[Lang]!['locationAddress11']!,
      //     "+998915431183",
      //     39.65539548045595,
      //     66.91923521161371
      // ),
      //
      // //Divider:
      // Divider(
      //   thickness: 1,
      //   color: Colors.black,
      // ),
      //
      // //Сурхандарьинский областной перинатальный центр
      // Location(
      //     Words[Lang]!['locationName12']!,
      //     Words[Lang]!['locationAddress12']!,
      //     "+998937935956",
      //     37.261059604983494,
      //     67.3086128408104
      // ),
      //
      // //Divider:
      // Divider(
      //   thickness: 1,
      //   color: Colors.black,
      // ),
      //
      // //Сырдарьинский областной перинатальный центр
      // Location(
      //     Words[Lang]!['locationName13']!,
      //     Words[Lang]!['locationAddress13']!,
      //     "+998974947757",
      //     41.12711823876792,
      //     69.32060133183964
      // ),
      //
      // //Divider:
      // Divider(
      //   thickness: 1,
      //   color: Colors.black,
      // ),
      //
      // //Ферганский областной перинатальный центр
      // Location(
      //     Words[Lang]!['locationName14']!,
      //     Words[Lang]!['locationAddress14']!,
      //     "+998732267341",
      //     40.36916522769689,
      //     71.7926703827937
      // ),
      //
      // //Divider:
      // Divider(
      //   thickness: 1,
      //   color: Colors.black,
      // ),
      //
      // //Хоремский областной перинатальный центр
      // Location(
      //     Words[Lang]!['locationName15']!,
      //     Words[Lang]!['locationAddress15']!,
      //     "+998977928855",
      //     41.53779426366273,
      //     60.6321112558349
      // ),

      //Divider:
      // Divider(
      //   thickness: 1,
      //   color: Colors.black,
      // ),


    ];

    Locations.sort((a, b) => a.getDistanceMeter().compareTo(b.getDistanceMeter()));

    return Scaffold(

      backgroundColor: Color.fromRGBO(192, 244, 246, 1),

      body: Container(
        padding: EdgeInsets.fromLTRB(
            15.0,
            60.0,
            15.0,
            10.0
        ),
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Title
                Text(
                  Words[Lang]!['LocationsScreenTitle']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30 / FontSizeScale,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: 30,
                ),
                // Divider:
                // Divider(
                //   thickness: 1,
                //   color: Colors.black,
                // ),
                //
                // // Ташкентский областной перинатальный центр
                // Location(
                //     Words[Lang]!['locationName3']!,
                //     Words[Lang]!['locationAddress3']!,
                //     "+998707129204",
                //     41.4452823345087,
                //     69.55616626352564
                // ),
                //
                // //Divider:
                // Divider(
                //   thickness: 1,
                //   color: Colors.black,
                // ),
                //
                // //Городской Перинатальный центр
                // Location(
                //     Words[Lang]!['locationName4']!,
                //     Words[Lang]!['locationAddress4']!,
                //     "+998712429408",
                //     41.321356,
                //     69.217543
                // ),
                //
                // //Divider:
                // Divider(
                //   thickness: 1,
                //   color: Colors.black,
                // ),
                //
                // // Перинатальный центр Республики Каракалпакистан
                // Location(
                //     Words[Lang]!['locationName5']!,
                //     Words[Lang]!['locationAddress5']!,
                //     "+998612240319",
                //     42.467808671355726,
                //     59.61721748257821
                // ),
                //
                // //Divider:
                // Divider(
                //   thickness: 1,
                //   color: Colors.black,
                // ),
                //
                // // Андижанский областной перинатальный центр
                // Location(
                //     Words[Lang]!['locationName6']!,
                //     Words[Lang]!['locationAddress6']!,
                //     "+998979920085",
                //     41.00166557993149,
                //     72.25454733290063
                // ),
                //
                // //Divider:
                // Divider(
                //   thickness: 1,
                //   color: Colors.black,
                // ),
                //
                // //Бухарский областной перинатальный центр
                // Location(
                //     Words[Lang]!['locationName7']!,
                //     Words[Lang]!['locationAddress7']!,
                //     "+998914128810",
                //     39.74967460482171,
                //     64.40364668463066
                // ),
                //
                // //Divider:
                // Divider(
                //   thickness: 1,
                //   color: Colors.black,
                // ),
                //
                // //Джизакский областной перинатальный центр
                // Location(
                //     Words[Lang]!['locationName8']!,
                //     Words[Lang]!['locationAddress8']!,
                //     "+998952806970",
                //     40.13447066484154,
                //     67.8797934072932
                // ),
                //
                // //Divider:
                // Divider(
                //   thickness: 1,
                //   color: Colors.black,
                // ),
                //
                // //Навоийский областной перинатальный центр
                // Location(
                //     Words[Lang]!['locationName9']!,
                //     Words[Lang]!['locationAddress9']!,
                //     "+998792204488",
                //     39.76062846988888,
                //     64.41146723920926
                // ),
                //
                // //Divider:
                // Divider(
                //   thickness: 1,
                //   color: Colors.black,
                // ),
                //
                // //Наманганский перинатальный центр
                // Location(
                //     Words[Lang]!['locationName10']!,
                //     Words[Lang]!['locationAddress10']!,
                //     "+998692392571",
                //     41.00492523120116,
                //     71.7061814992722
                // ),
                //
                // //Divider:
                // Divider(
                //   thickness: 1,
                //   color: Colors.black,
                // ),
                //
                // //Самаркандский областной перинатальный центр
                // Location(
                //     Words[Lang]!['locationName11']!,
                //     Words[Lang]!['locationAddress11']!,
                //     "+998915431183",
                //     39.65539548045595,
                //     66.91923521161371
                // ),
                //
                // //Divider:
                // Divider(
                //   thickness: 1,
                //   color: Colors.black,
                // ),
                //
                // //Сурхандарьинский областной перинатальный центр
                // Location(
                //     Words[Lang]!['locationName12']!,
                //     Words[Lang]!['locationAddress12']!,
                //     "+998937935956",
                //     37.261059604983494,
                //     67.3086128408104
                // ),
                //
                // //Divider:
                // Divider(
                //   thickness: 1,
                //   color: Colors.black,
                // ),
                //
                // //Сырдарьинский областной перинатальный центр
                // Location(
                //     Words[Lang]!['locationName13']!,
                //     Words[Lang]!['locationAddress13']!,
                //     "+998974947757",
                //     41.12711823876792,
                //     69.32060133183964
                // ),
                //
                // //Divider:
                // Divider(
                //   thickness: 1,
                //   color: Colors.black,
                // ),
                //
                // //Ферганский областной перинатальный центр
                // Location(
                //     Words[Lang]!['locationName14']!,
                //     Words[Lang]!['locationAddress14']!,
                //     "+998732267341",
                //     40.36916522769689,
                //     71.7926703827937
                // ),
                //
                // //Divider:
                // Divider(
                //   thickness: 1,
                //   color: Colors.black,
                // ),
                //
                // //Хоремский областной перинатальный центр
                // Location(
                //     Words[Lang]!['locationName15']!,
                //     Words[Lang]!['locationAddress15']!,
                //     "+998977928855",
                //     41.53779426366273,
                //     60.6321112558349
                // ),

                //Divider:
                // Divider(
                //   thickness: 1,
                //   color: Colors.black,
                // ),

              ]+Locations,
            ),
          ),
          thumbVisibility: true,
          thickness: 8,
        ),
      ),

    );




    // return Center(
    //   child: ElevatedButton(
    //     child: Text("Open Map"),
    //     onPressed: () async{
    //       double latitude = 41.32123842399223;
    //       double longitude = 69.2175144057339;
    //       String URL = "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    //       await launchUrl(Uri.parse(URL));
    //     },
    //   ),
    // );

  }

}