import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:homila_ai/my_icons_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homila_ai/text.dart';
import 'package:homila_ai/TestScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var connectivity=null;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> newLang;
  Widget? scaffoldBody = null;
  String testString = "";
  bool isLocationLoading = false;

  Future<void> getLang(FontSizeScale, ScreenWidth, ScreenHeight, context) async {
    final SharedPreferences prefs = await _prefs;
    final String? currentLang = prefs.getString("lang");
    // final String? currentLang = 'uz';

    // If the language has been defined already, then we start the main home page
    if(currentLang!=null) setState(() {
      Lang = currentLang;
      Widget HomeScreen_button(IconData? btn_icon, String btn_label,
          void Function() btn_onPressed, {r = 127, g = 206, b = 209}){
        return ElevatedButton(
          onPressed: btn_onPressed,

          style: ElevatedButton.styleFrom(
            fixedSize: Size(ScreenWidth/3, ScreenWidth/3),
              primary: Color.fromRGBO(r, g, b, 1),
              elevation: 60,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              )
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                btn_icon,
                size: ScreenWidth/10,
              ),
              SizedBox(height: 5,),
              Text(
                btn_label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15/FontSizeScale,
                  fontWeight: FontWeight.normal,
                  // letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        );
      }

      scaffoldBody = Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),

            //Logo and title
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/NewLogo2.png", scale: 3),
                Text(
                  "Homila AI",
                  style: GoogleFonts.audiowide(
                      color: Color.fromRGBO(2, 2, 143, 1.0),
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),

                // SizedBox(height: ScreenWidth/15),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: ScreenWidth/15),
                  height: ScreenWidth/3.8,
                  child: Center(
                    child: Text(
                      Words[Lang]!['Name']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,

                          // color: Colors.blue,

                          fontSize: 30/FontSizeScale,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                          // shadows: [
                          //   Shadow(
                          //       offset: Offset(5.0, 10.0),
                          //       blurRadius: 60.0,
                          //       color: Colors.black.withOpacity(0.6)
                          //   )
                          // ]
                      ),
                    ),
                  ),
                ),
              ],
            ),


            // Buttons container
            Container(

              height: ScreenWidth/1.35,
              width: ScreenWidth/1.35,
              // color: Colors.white,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeScreen_button(
                          MyIcons.robot,
                          Words[Lang]!["AI_Test"]!,
                          () {

                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => Dialog(
                                  backgroundColor: Colors.grey[100],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      height: 450,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [

                                          Text(
                                            Words[Lang]!['TermsTitle']!,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20 / FontSizeScale,
                                                fontWeight: FontWeight.bold),
                                          ),

                                          Text(
                                            Words[Lang]!['TermsSubtitle']!,
                                            style: TextStyle(
                                                fontSize: 20 / FontSizeScale),
                                          ),

                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                color: Colors.lightBlue,
                                                size: 15/FontSizeScale,
                                              ),
                                              SizedBox(width: 15,),
                                              Expanded(
                                                child: Text(
                                                  Words[Lang]!['Terms1']!,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                      fontSize: 20 / FontSizeScale),
                                                ),
                                              )
                                            ],
                                          ),

                                          Row(
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                color: Colors.lightBlue,
                                                size: 15/FontSizeScale,
                                              ),
                                              SizedBox(width: 15,),
                                              Expanded(
                                                child: Text(
                                                  Words[Lang]!['Terms2']!,
                                                  softWrap: true,
                                                  style: TextStyle(
                                                      fontSize: 20 / FontSizeScale),
                                                ),
                                              )
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              TextButton.icon(
                                                  onPressed:   () async {
                                                    Navigator.pop(context);
                                                    connectivity = await InternetConnectionChecker().hasConnection;
                                                    // Navigator.of(context).pop();
                                                    Navigator.pushNamed(context,'/test');
                                                    // if (await InternetConnectionChecker().hasConnection == false) {
                                                    // print("No Internet");
                                                    // Navigator.pushNamed(context, '/test');
                                                    // }
                                                  },
                                                  icon: Icon(Icons.check_box),
                                                  label: Text(
                                                    Words[Lang]!['Start']!
                                                  ),
                                                style: ButtonStyle(
                                                    foregroundColor: MaterialStateProperty.all(Colors.green),
                                                  textStyle: MaterialStateProperty.all(
                                                    TextStyle(
                                                      fontSize: 20/FontSizeScale,
                                                      color: Colors.green,
                                                      decoration: TextDecoration.underline,
                                                      // decorationThickness: 3,
                                                    )
                                                  )
                                                ),
                                              ),

                                              TextButton.icon(
                                                onPressed:   () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(Icons.close),
                                                label: Text(
                                                    Words[Lang]!['Cancel']!
                                                ),
                                                style: ButtonStyle(
                                                  foregroundColor: MaterialStateProperty.all(Colors.red),
                                                    textStyle: MaterialStateProperty.all(
                                                        TextStyle(
                                                            fontSize: 20/FontSizeScale,
                                                            color: Colors.red,
                                                            decoration: TextDecoration.underline,
                                                          // decorationThickness: 3,
                                                        )
                                                    )
                                                ),
                                              ),
                                            ],
                                          )

                                        ],
                                      ),
                                    ),
                                  ),
                                )
                            );

                          },
                            //   () async {
                            //     connectivity = await InternetConnectionChecker().hasConnection;
                            //     // Navigator.of(context).pop();
                            //     Navigator.pushNamed(context,'/test');
                            //     // if (await InternetConnectionChecker().hasConnection == false) {
                            //       // print("No Internet");
                            //       // Navigator.pushNamed(context, '/test');
                            //     // }
                            // },
                          r: 3, g: 152, b: 158),

                      HomeScreen_button(
                        Icons.chat,
                        Words[Lang]!["Online_consultation"]!,
                            () {
                              showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (context) => Dialog(
                                    backgroundColor: Colors.grey[100],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            Words[Lang]!['InProcess']!,
                                            style: TextStyle(
                                              fontSize: 20/FontSizeScale
                                            ),                                            
                                          ),
                                          ElevatedButton(
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                              child: Text("OK")
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                              );
                        }
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      HomeScreen_button(
                          MyIcons.notes_medical,
                          Words[Lang]!["СhangesDuringPregnancy"]!,
                              (){
                                Navigator.pushNamed(context,'/changes');
                              }
                      ),

                      HomeScreen_button(
                          Icons.location_on,
                          Words[Lang]!["Perinatal_locations"]!,
                              () async{
                            // Navigator.pushNamed(context,'/locations');

                            // print(myLocationLatitude);
                            // print(myLocationLongitude);


                            PermissionStatus locationStatus = await Permission.location.request();

                            if(locationStatus == PermissionStatus.granted){
                              setState(() {
                                isLocationLoading = true;
                              });
                              var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
                              double currentLocationLatitude = position.latitude;
                              double currentLocationLongitude = position.longitude;
                              print(currentLocationLatitude);
                              print(currentLocationLongitude);
                              // await Future.delayed(Duration(seconds: 10));
                              Navigator.pushNamed(context,'/locations', arguments: [currentLocationLatitude, currentLocationLongitude] );
                              await Future.delayed(Duration(seconds: 1));
                              setState(() {
                                isLocationLoading = false;
                                print("isLocationLoading = false;");
                              });
                            }
                          }
                      ),

                    ],
                  ),

                ],
              ),

            ),



            SizedBox(
              // height: ScreenHeight/10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: (){
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => Dialog(
                            backgroundColor: Colors.grey[100],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                            Words[Lang]!['About_app']!,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20 / FontSizeScale,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Container(
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 25 / FontSizeScale,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          padding: EdgeInsets.all(0),
                                        ),
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                            BorderRadius.circular(12.5)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    color: Colors.grey[200],
                                    height: ScreenHeight/2,
                                    child: Scrollbar(
                                      thickness: 10,
                                      thumbVisibility: true,
                                      child: SingleChildScrollView(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          Words[Lang]!['AboutAppText']!,
                                          softWrap: true,
                                          style:
                                          TextStyle(fontSize: 20 / FontSizeScale),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                      );
                    },
                    icon: Icon(
                      Icons.info_outline_rounded,
                      color: Colors.blue,
                      size: 18/FontSizeScale,
                    ),
                    label: Text(
                      Words[Lang]!["About_app"]!,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 18/FontSizeScale,
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: (){
                      ShowChangeLangMenu(context);
                    },
                    icon: Icon(
                      Icons.language,
                      color: Colors.blue,
                      size: 18/FontSizeScale,
                    ),
                    label: Text(
                      Words[Lang]!["Change_lang"]!,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 18/FontSizeScale,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // SizedBox(height: ScreenWidth/25,)

          ],
        ),
      );
    });

    // else if language is not defined, then we have to select language
    else setState(() {
      // print("Select lang");
      scaffoldBody = Center(
        child: Container(
          // color: Colors.white,
          width: ScreenWidth/1.5,
          height: ScreenWidth/1.5,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                "Tilni tanlang / Выберите язык",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30/FontSizeScale,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          offset: Offset(5.0, 10.0),
                          blurRadius: 60.0,
                          color: Colors.black.withOpacity(0.6)
                      )
                    ]
                ),
              ),

              ElevatedButton(
                onPressed: ()async{
                  prefs.setString("lang", "uz");
                  await getLang(FontSizeScale, ScreenWidth, ScreenHeight, context);
                },

                child: Row(
                  children: [
                    Image(
                      image: AssetImage("assets/images/UZ_flag.png"),
                      height: 30, width: 50, fit: BoxFit.fill,
                    ),
                    Expanded(
                        child: Text(
                            "O‘zbek",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20/FontSizeScale
                            )
                        )
                    )
                  ],
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(127, 206, 209, 1),
                  fixedSize: Size(ScreenWidth/1.5, 50),
                  elevation: 30,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),

              ElevatedButton(
                onPressed: ()async{
                  prefs.setString("lang", "ru");
                  await getLang(FontSizeScale, ScreenWidth, ScreenHeight, context);
                },

                child: Row(
                  children: [
                    Image(
                      image: AssetImage("assets/images/RU_flag.png"),
                      height: 30, width: 50, fit: BoxFit.fill,
                    ),
                    Expanded(
                      child: Text(
                        "Русский",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20/FontSizeScale
                        )
                      )
                    )
                  ],
                ),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(127, 206, 209, 1),
                  fixedSize: Size(ScreenWidth/1.5, 50),
                  elevation: 30,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
            ],
          ),
        )
      );
    });
  }


  @override
  Widget build(BuildContext context){
    double FontSizeScale = MediaQuery.of(context).textScaleFactor;
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.height;

    getLang(FontSizeScale, ScreenWidth, ScreenHeight, context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(192, 244, 246, 1),
      body: !isLocationLoading ? scaffoldBody :
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitDoubleBounce(
              color: Colors.red,
              size: 80,
              duration: Duration(milliseconds: 1000),
            ),
            Text(
              Words[Lang]!['gettingLocation']!,
            ),
          ],
        ),

        // child: SpinKitSpinningLines(
        //   color: Colors.blueGrey,
        //   size: 100,
        //   lineWidth: 3.0,
        // ),
      )
    );

  }


  Future<void> ShowChangeLangMenu(BuildContext context) async {
    final SharedPreferences prefs = await _prefs;
    double FontSizeScale = MediaQuery.of(context).textScaleFactor;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => new Dialog(
        backgroundColor: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Tilni tanlang:\nВыберите язык:",
                style: TextStyle(fontSize: 20/FontSizeScale,),
              ),

              SizedBox(height: 10.0,),

              RadioListTile<String>(
                value: "ru",
                groupValue: Lang,
                // activeColor: Colors.white,
                title: RichText(
                  text: TextSpan(
                      style: isActive("ru"),
                      children: [
                        WidgetSpan(child: Image(image: AssetImage("assets/images/RU_flag.png"), height: 30, width: 50, fit: BoxFit.fill,),
                            alignment: PlaceholderAlignment.middle),
                        TextSpan(text: '   Русский',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25/FontSizeScale,
                            )
                        ),
                      ]
                  ),
                ),

                onChanged: (value){
                  prefs.setString("lang", "ru");
                  setState(() => Lang = value!);
                  print(Lang);
                  Navigator.of(context).pop();
                },

              ),

              RadioListTile<String>(
                value: "uz",
                groupValue: Lang,
                // activeColor: Colors.white,
                title: RichText(
                  text: TextSpan(
                      style: isActive("uz"),
                      children: [
                        WidgetSpan(child: Image(image: AssetImage("assets/images/UZ_flag.png"), height: 30, width: 50, fit: BoxFit.fill,),
                            alignment: PlaceholderAlignment.middle),
                        TextSpan(text: '   O‘zbek',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25/FontSizeScale,
                            )
                        ),
                      ]
                  ),
                ),

                onChanged: (value){
                  prefs.setString("lang", "uz");
                  setState(() => Lang = value!);
                  print(Lang);
                  Navigator.of(context).pop();
                },
              ),

              SizedBox(height: 10.0,),

              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(Words[Lang]!["Cancel"]!,
                      style: TextStyle(fontSize: 20/FontSizeScale,
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                      )
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }

  TextStyle isActive(val){
    // double FontSizeScale = MediaQuery.of(context).textScaleFactor;
    if(val==Lang) {
      return TextStyle(
        fontWeight: FontWeight.bold,
        // fontSize: 30 / FontSizeScale,
      );
    }
    else {
      return TextStyle(
        fontWeight: FontWeight.normal,
        // fontSize: 30 / FontSizeScale,
      );
    }
  }

}
