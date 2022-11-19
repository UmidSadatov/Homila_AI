import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homila_ai/text.dart';
import 'package:homila_ai/HomeScreen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int? age = 15; // 15-70
  int? systolicBloodPressure = 60; // 60-250
  int? diastolicBloodPressure = 40; // 40-120
  double? glucoseAmount = 2.0; // 2.0 - 20.0
  double? bodyTemperature = 35.0; // 35.0 - 41.0
  int? pulse = 40; // 40 - 180

  var ageTextController = new TextEditingController(text: "15");
  String ageErrorText = "";

  var systolicBloodPressureTextController = new TextEditingController(text: "60");
  String systolicBloodPressureErrorText = "";

  var diastolicBloodPressureTextController = new TextEditingController(text: "40");
  String diastolicBloodPressureErrorText = "";

  var glucoseAmountTextController = new TextEditingController(text: "2.0");
  String glucoseAmountErrorText = "";

  var bodyTemperatureTextController = new TextEditingController(text: "35.0");
  String bodyTemperatureErrorText = "";

  var pulseTextController = new TextEditingController(text: "40");
  String pulseErrorText = "";

  late StreamSubscription subscription;
  var isConnected = false;
  var isAlertSet = !connectivity;

  bool isDataEntered = false;

  bool haveResult = false;

  String resultText = "";

  Widget? resultWidget;

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isConnected = await InternetConnectionChecker().hasConnection;
          if (!isConnected && isAlertSet == false) {
            setState(() => isAlertSet = true);
          } else {
            setState(() => isAlertSet = false);
          }
        },
      );

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double FontSizeScale = MediaQuery.of(context).textScaleFactor;
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.height;

    Widget DataEnterence(
      String TitleText,
      TextEditingController? TextController,
      num min,
      num max,
      void Function(String)? onChanged,
      void Function(String)? onFieldSubmitted,
      int TextFieldMaxLength,
      String errorText,
      double sliderValue,
      void Function(double)? onSliderChanged,
    ) {
      return SizedBox(
        child: Column(
          children: [
            //  Title and Text Field
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: ScreenWidth / 2.5,
                  child: Text(
                    TitleText,
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18 / FontSizeScale,
                        color: Colors.black),
                  ),
                ),
                SizedBox(width: 35),
                SizedBox(
                  width: 80,
                  child: Form(
                    child: TextFormField(
                      controller: TextController,
                      onChanged: onChanged,
                      onFieldSubmitted: onFieldSubmitted,
                      maxLength: TextFieldMaxLength,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20 / FontSizeScale,
                      ),
                      decoration: InputDecoration(
                        counterText: "",
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 3),
                        ),
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                ),
              ],
            ),

            // Error text
            Text(
              errorText,
              style: TextStyle(color: Colors.red, fontSize: 15 / FontSizeScale),
            ),

            // Slider
            Slider(
                value: sliderValue,
                min: min.toDouble(),
                max: max.toDouble(),
                onChanged: onSliderChanged),
          ],
        ),
      );
    }


    Future<void> getResult(String ipAddress, int durationSeconds)async {
      final response = await http.get(Uri.parse('http://$ipAddress:6788/data?'
          'age=$age&'
          'sbp=$systolicBloodPressure&'
          'dbp=$diastolicBloodPressure'
          '&ga=$glucoseAmount&'
          'bt=$bodyTemperature&'
          'pulse=$pulse')
      ).timeout(Duration(seconds: durationSeconds));

      final decoded = json.decode(response.body) as Map<String, dynamic>;

      print(decoded['result']);

      setState(() {
        final resultName = decoded['result'];

        resultWidget = Container(
          padding: EdgeInsets.symmetric(
              vertical: ScreenHeight/8,
              horizontal: ScreenWidth/6
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Image.asset("assets/images/$resultName.png", scale: 3.5),

              // SizedBox(height: ScreenHeight/20),

              Text(
                Words[Lang]!["$resultName title"]!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30/FontSizeScale,
                    fontWeight: FontWeight.bold
                ),
              ),

              // SizedBox(height: ScreenHeight/20),

              Text(
                Words[Lang]!["$resultName text"]!,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20/FontSizeScale,
                  fontWeight: FontWeight.normal,
                ),
                // softWrap: true,
              ),
              
              TextButton.icon(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    size: 25/FontSizeScale,
                  ),
                  label: Text(
                      Words[Lang]!["MainMenu"]!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20/FontSizeScale
                    ),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 15)),
                      backgroundColor: MaterialStateProperty.
                      all(Color.fromRGBO(3, 152, 158, 1)),
                      shape: MaterialStateProperty.all
                        (RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))
                  ),
              )
            ],
          ),
        );

        haveResult = true;
      });
    }







    return Scaffold(
        backgroundColor: Color.fromRGBO(192, 244, 246, 1),
        body: isDataEntered ?

        // when data entered

        (haveResult ?
        //    Result or error message
        resultWidget :
        //    Loading animation
        Center(
          child: SpinKitSpinningLines(
            color: Colors.blueGrey,
            size: 100,
            lineWidth: 3.0,
          ),
        )) :

        (isAlertSet ?
        //    NoInternet message
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.signal_wifi_connected_no_internet_4_sharp,
            //   size: 120/FontSizeScale,
            //   color: Colors.red,
            // ),
            Image(
              image: AssetImage("assets/images/No_Internet.png"),
              // height: 30,
              // width: 50,
              fit: BoxFit.fill,
            ),
            Text(
              Words[Lang]!['No_connectivity']!,
              style: TextStyle(
                  fontSize: 30 / FontSizeScale,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
            Text(
              Words[Lang]!['Plese_check_connectivity']!,
              style: TextStyle(
                  fontSize: 14 / FontSizeScale, color: Colors.red),
            )
          ],
        )) :
        //    Data Enterence page
        GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                ageErrorText = "";
                ageTextController.text = age.toString();

                systolicBloodPressureErrorText = "";
                systolicBloodPressureTextController.text = systolicBloodPressure.toString();

                diastolicBloodPressureErrorText = "";
                diastolicBloodPressureTextController.text = diastolicBloodPressure.toString();

                glucoseAmountErrorText = "";
                glucoseAmountTextController.text = glucoseAmount.toString();

                bodyTemperatureErrorText = "";
                bodyTemperatureTextController.text = bodyTemperature.toString();

                pulseErrorText = "";
                pulseTextController.text = pulse.toString();
              });
            },
            child: Container(
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
                        Words[Lang]!['Please_enter_data']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30 / FontSizeScale,
                          fontWeight: FontWeight.bold,
                          // shadows: [
                          //   Shadow(
                          //       offset: Offset(5.0, 10.0),
                          //       blurRadius: 60.0,
                          //       color: Colors.black.withOpacity(0.6)
                          //   )
                          // ]
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      Container(
                        width: ScreenWidth - 100,
                        // color: Colors.white,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //////////////////////
                            // Age:
                            DataEnterence(
                                Words[Lang]!['Enter_age']!,
                                ageTextController, 15, 70,
                                    (text) {
                                  try {
                                    int newVal = int.parse(text);
                                    if (newVal >= 15 && newVal <= 70) {
                                      age = newVal;
                                      setState(() {
                                        ageErrorText = "";
                                      });
                                    } else {
                                      setState(() {
                                        ageErrorText =
                                        Words[Lang]!['ageErrorText']!;
                                      });
                                    }
                                  } catch (err) {
                                    setState(() {
                                      ageErrorText =
                                      Words[Lang]!['ageErrorText']!;
                                    });
                                  }
                                },
                                    (text) {
                                  setState(() {
                                    ageErrorText = "";
                                  });
                                  try {
                                    int newVal = int.parse(text);
                                    if(newVal>=15 && newVal<=70){
                                      age = newVal;
                                    }
                                    else {
                                      ageTextController.text = age.toString();
                                    }
                                  }
                                  catch (err) {
                                    ageTextController.text = age.toString();
                                  }
                                },
                                2,
                                ageErrorText,
                                age!.toDouble(),
                                    (value) {
                                  setState(() {
                                    age = value.round();
                                    ageTextController.text = "$age";
                                    ageErrorText = "";
                                  });
                                  FocusScope.of(context).unfocus();
                                }
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            //Divider:
                            Divider(
                              thickness: 1,
                              color: Colors.black,
                            ),

                            /////////////////////////
                            // systolicBloodPresure
                            SizedBox(
                              height: 20,
                            ),

                            DataEnterence(
                                Words[Lang]!['Enter_systolic_pressure']!,
                                systolicBloodPressureTextController,
                                60, 250,
                                    (text) {
                                  try {
                                    int newVal = int.parse(text);
                                    if (newVal >= 60 && newVal <= 250) {
                                      systolicBloodPressure = newVal;
                                      setState(() {
                                        systolicBloodPressureErrorText = "";
                                      });
                                    } else {
                                      setState(() {
                                        systolicBloodPressureErrorText =
                                        Words[Lang]!['systolicBloodPressureErrorText']!;
                                      });
                                    }
                                  } catch (err) {
                                    setState(() {
                                      systolicBloodPressureErrorText =
                                      Words[Lang]!['systolicBloodPressureErrorText']!;
                                    });
                                  }
                                },
                                    (text) {
                                  setState(() {
                                    systolicBloodPressureErrorText = "";
                                  });
                                  try {
                                    int newVal = int.parse(text);
                                    if(newVal>=60 && newVal<=250){
                                      systolicBloodPressure = newVal;
                                    }
                                    else {
                                      systolicBloodPressureTextController.text = systolicBloodPressure.toString();
                                    }
                                  }
                                  catch (err) {
                                    systolicBloodPressureTextController.text = systolicBloodPressure.toString();
                                  }
                                },
                                3,
                                systolicBloodPressureErrorText,
                                systolicBloodPressure!.toDouble(),
                                    (value) {
                                  setState(() {
                                    systolicBloodPressure = value.round();
                                    systolicBloodPressureTextController.text = "$systolicBloodPressure";
                                    systolicBloodPressureErrorText = "";
                                  });
                                  FocusScope.of(context).unfocus();
                                }
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            //Divider:
                            Divider(
                              thickness: 1,
                              color: Colors.black,
                            ),

                            /////////////////////////
                            // diastolicBloodPressure

                            SizedBox(
                              height: 20,
                            ),

                            DataEnterence(
                                Words[Lang]!['Enter_diastolic_pressure']!,
                                diastolicBloodPressureTextController,
                                40, 120,
                                    (text) {
                                  try {
                                    int newVal = int.parse(text);
                                    if (newVal >= 40 && newVal <= 120) {
                                      diastolicBloodPressure = newVal;
                                      setState(() {
                                        diastolicBloodPressureErrorText = "";
                                      });
                                    }
                                    else {
                                      setState(() {
                                        diastolicBloodPressureErrorText =
                                        Words[Lang]!['diastolicBloodPressureErrorText']!;
                                      });
                                    }
                                  } catch (err) {
                                    setState(() {
                                      diastolicBloodPressureErrorText =
                                      Words[Lang]!['diastolicBloodPressureErrorText']!;
                                    });
                                  }
                                },
                                    (text) {
                                  setState(() {
                                    diastolicBloodPressureErrorText = "";
                                  });
                                  try {
                                    int newVal = int.parse(text);
                                    if(newVal>=40 && newVal<=120){
                                      diastolicBloodPressure = newVal;
                                    }
                                    else {
                                      diastolicBloodPressureTextController.text = diastolicBloodPressure.toString();
                                    }
                                  }
                                  catch (err) {
                                    diastolicBloodPressureTextController.text = diastolicBloodPressure.toString();
                                  }
                                },
                                3,
                                diastolicBloodPressureErrorText,
                                diastolicBloodPressure!.toDouble(),
                                    (value) {
                                  setState(() {
                                    diastolicBloodPressure = value.round();
                                    diastolicBloodPressureTextController.text = "$diastolicBloodPressure";
                                    diastolicBloodPressureErrorText = "";
                                  });
                                  FocusScope.of(context).unfocus();
                                }
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            //Divider:
                            Divider(
                              thickness: 1,
                              color: Colors.black,
                            ),

                            /////////////////////////
                            // glucoseAmount

                            SizedBox(
                              height: 20,
                            ),

                            DataEnterence(
                                Words[Lang]!['Enter_glucose_amount']!,
                                glucoseAmountTextController,
                                2.0, 20.0,
                                    (text) {
                                  try {
                                    double newVal = double.parse(text);
                                    if (newVal >= 2.0 && newVal <= 20.0) {
                                      glucoseAmount = double.parse(newVal.toStringAsFixed(1));
                                      setState(() {
                                        glucoseAmountErrorText = "";
                                      });
                                    }
                                    else {
                                      setState(() {
                                        glucoseAmountErrorText =
                                        Words[Lang]!['glucoseAmountErrorText']!;
                                      });
                                    }
                                  } catch (err) {
                                    setState(() {
                                      glucoseAmountErrorText =
                                      Words[Lang]!['glucoseAmountErrorText']!;
                                    });
                                  }
                                },
                                    (text) {
                                  setState(() {
                                    glucoseAmountErrorText = "";
                                  });
                                  try {
                                    double newVal = double.parse(text);
                                    if(newVal>=2.0 && newVal<=20.0){
                                      glucoseAmount = double.parse(newVal.toStringAsFixed(1));
                                      glucoseAmountTextController.text = glucoseAmount.toString();
                                    }
                                    else {
                                      glucoseAmountTextController.text = glucoseAmount.toString();
                                    }
                                  }
                                  catch (err) {
                                    glucoseAmountTextController.text = glucoseAmount.toString();
                                  }
                                },
                                4,
                                glucoseAmountErrorText,
                                glucoseAmount!,
                                    (value) {
                                  setState(() {
                                    glucoseAmount = double.parse(value.toStringAsFixed(1));
                                    glucoseAmountTextController.text = "$glucoseAmount";
                                    glucoseAmountErrorText = "";
                                  });
                                  FocusScope.of(context).unfocus();
                                }
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            //Divider:
                            Divider(
                              thickness: 1,
                              color: Colors.black,
                            ),

                            /////////////////////////
                            // bodyTemperature

                            SizedBox(
                              height: 20,
                            ),

                            DataEnterence(
                                Words[Lang]!['Enter_body_temperature']!,
                                bodyTemperatureTextController,
                                35.0, 41.0,
                                    (text) {
                                  try {
                                    double newVal = double.parse(text);
                                    if (newVal >= 35.0 && newVal <= 41.0) {
                                      bodyTemperature = double.parse(newVal.toStringAsFixed(1));
                                      setState(() {
                                        bodyTemperatureErrorText = "";
                                      });
                                    }
                                    else {
                                      setState(() {
                                        bodyTemperatureErrorText =
                                        Words[Lang]!['bodyTemperatureErrorText']!;
                                      });
                                    }
                                  } catch (err) {
                                    setState(() {
                                      bodyTemperatureErrorText =
                                      Words[Lang]!['bodyTemperatureErrorText']!;
                                    });
                                  }
                                },
                                    (text) {
                                  setState(() {
                                    bodyTemperatureErrorText = "";
                                  });
                                  try {
                                    double newVal = double.parse(text);
                                    if(newVal>=35.0 && newVal<=41.0){
                                      bodyTemperature = double.parse(newVal.toStringAsFixed(1));
                                      bodyTemperatureTextController.text = bodyTemperature.toString();
                                    }
                                    else {
                                      bodyTemperatureTextController.text = bodyTemperature.toString();
                                    }
                                  }
                                  catch (err) {
                                    bodyTemperatureTextController.text = bodyTemperature.toString();
                                  }
                                },
                                4,
                                bodyTemperatureErrorText,
                                bodyTemperature!,
                                    (value) {
                                  setState(() {
                                    bodyTemperature = double.parse(value.toStringAsFixed(1));
                                    bodyTemperatureTextController.text = "$bodyTemperature";
                                    bodyTemperatureErrorText = "";
                                  });
                                  FocusScope.of(context).unfocus();
                                }
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            //Divider:
                            Divider(
                              thickness: 1,
                              color: Colors.black,
                            ),

                            /////////////////////////
                            // pulse  40-180

                            SizedBox(
                              height: 20,
                            ),

                            DataEnterence(
                                Words[Lang]!['Enter_pulse']!,
                                pulseTextController, 40, 180,
                                    (text) {
                                  try {
                                    int newVal = int.parse(text);
                                    if (newVal >= 40 && newVal <= 180) {
                                      pulse = newVal;
                                      setState(() {
                                        pulseErrorText = "";
                                      });
                                    } else {
                                      setState(() {
                                        pulseErrorText =
                                        Words[Lang]!['pulseErrorText']!;
                                      });
                                    }
                                  } catch (err) {
                                    setState(() {
                                      pulseErrorText =
                                      Words[Lang]!['pulseErrorText']!;
                                    });
                                  }
                                },
                                    (text) {
                                  setState(() {
                                    pulseErrorText = "";
                                  });
                                  try {
                                    int newVal = int.parse(text);
                                    if(newVal>=40 && newVal<=180){
                                      pulse = newVal;
                                    }
                                    else {
                                      pulseTextController.text = pulse.toString();
                                    }
                                  }
                                  catch (err) {
                                    pulseTextController.text = pulse.toString();
                                  }
                                },
                                3,
                                pulseErrorText,
                                pulse!.toDouble(),
                                    (value) {
                                  setState(() {
                                    pulse = value.round();
                                    pulseTextController.text = "$pulse";
                                    pulseErrorText = "";
                                  });
                                  FocusScope.of(context).unfocus();
                                }
                            ),

                            SizedBox(
                              height: 30,
                            ),


                            ///////////////////////
                            //  Button

                            ElevatedButton.icon(
                              icon: Icon(
                                Icons.check_circle,
                                color: Colors.white,
                                size: 20/FontSizeScale,
                              ),
                              label: Text(
                                "OK",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20/FontSizeScale,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              onPressed: () async {

                                setState(() {
                                  isDataEntered = true;
                                });

                                try {
                                  await getResult("192.168.100.12", 2);
                                } on TimeoutException catch (err1) {
                                  print(err1);
                                  try{
                                    await getResult("195.158.16.43", 5);
                                  } on TimeoutException catch (err2){
                                    print(err2);
                                    try{
                                      await getResult("91.203.174.58", 5);
                                    } on TimeoutException catch (err3){
                                      print(err3);
                                      setState(() {
                                        // resultText = "Error";
                                        haveResult = true;

                                        resultWidget = Center(
                                          child: Text(
                                            'Server connection error',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20/FontSizeScale,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        );
                                      });
                                    }
                                  }
                                }
                              },

                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(10),
                                padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                                backgroundColor: MaterialStateProperty.all(Color.fromRGBO(3, 152, 158, 1)),
                              ),
                            ),

                            SizedBox(
                              height: 50,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                thumbVisibility: true,
                thickness: 8,
                // interactive: true,
              ),
            )))
    );
  }
}
