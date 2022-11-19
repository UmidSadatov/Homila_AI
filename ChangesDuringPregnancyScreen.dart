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

class infoContainer extends StatelessWidget {
  String riskType;
  List<InlineSpan> contentList;
  String recommendationText;

  infoContainer({
    Key? key,
    this.riskType = "normal",
    required this.contentList,
    required this.recommendationText,
  });

  @override
  Widget build(BuildContext context) {
    double FontSizeScale = MediaQuery.of(context).textScaleFactor;
    // double ScreenWidth = MediaQuery.of(context).size.width;
    // double ScreenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: riskType == "normal"
          ? Color.fromRGBO(115, 255, 132, 1.0)
          : (riskType == "doubt"
              ? Color.fromRGBO(241, 255, 109, 1.0)
              : (riskType == "problem"
                  ? Color.fromRGBO(255, 179, 179, 1.0)
                  : null)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // riskType=="normal" ? Color.fromRGBO(115, 255, 132, 1.0) :
          // (riskType=="doubt" ? Color.fromRGBO(241, 255, 109, 1.0) :
          // (riskType=="problem" ? Color.fromRGBO(255, 179, 179, 1.0) : null)),

          riskType == "normal"
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Color.fromRGBO(9, 98, 21, 1.0),
                      size: 16/FontSizeScale,
                    ),
                    Text(
                      Words[Lang]!["normalRiskType"]!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16/FontSizeScale
                      ),
                    ),
                  ],
                )
              : (riskType == "doubt"
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.question_mark_outlined,
                          color: Color.fromRGBO(255, 130, 0, 1.0),
                          size: 16/FontSizeScale,
                        ),
                        Text(
                          Words[Lang]!['doubtRiskType']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16/FontSizeScale
                          ),
                        ),
                      ],
                    )
                  : (riskType == "problem"
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.warning,
                              color: Color.fromRGBO(255, 52, 52, 1.0),
                              size: 16/FontSizeScale,
                            ),
                            Text(
                              Words[Lang]!['problemRiskType']!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16/FontSizeScale
                              ),
                            ),
                          ],
                        )
                      : SizedBox())),

          RichText(
              text: TextSpan(
            children: contentList,
            style: TextStyle(color: Colors.black, height: 1.5, wordSpacing: 5),
          )),

          TextButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => Dialog(
                          backgroundColor: Colors.grey[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      Words[Lang]!['Recommendations']!,
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
                                Container(
                                  child: Text(
                                    recommendationText,
                                    style:
                                        TextStyle(fontSize: 20 / FontSizeScale),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
              },
              child: Text(
                Words[Lang]!['Recommendations']!,
                style: TextStyle(
                  fontSize: 18 / FontSizeScale,
                  decoration: TextDecoration.underline,
                ),
              )),

          Divider(
            color: Colors.black,
            thickness: 1,
          )
        ],
      ),
    );
  }
}

class Trimester extends StatefulWidget {
  final String buttonLabel;
  final List<infoContainer> infoContainersList;
  late bool containersVisible;

  Trimester({
    super.key,
    required this.buttonLabel,
    required this.infoContainersList,
    this.containersVisible = false,
  });

  @override
  State<StatefulWidget> createState() => new TrimesterState();
}

class TrimesterState extends State<Trimester> with SingleTickerProviderStateMixin {
  // @override
  // void initState() {}

  @override
  Widget build(BuildContext context) {
    double FontSizeScale = MediaQuery.of(context).textScaleFactor;
    return Column(
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              widget.containersVisible = !widget.containersVisible;
            });
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.blue),
            // fixedSize: MaterialStatePropertyAll(Size.fromWidth(ScreenWidth)),
          ),
          child: Row(
            children: [
              AnimatedRotation(
                  turns: widget.containersVisible ? 0.25 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    // Icons.arrow_drop_down_sharp,
                    color: Colors.white,
                    size: 25 / FontSizeScale,
                  ),
              ),
              // Transform.rotate(
              //   angle: widget.containersVisible ? 90 * 3.1415 / 180 : 0,
              //   child: Icon(
              //     Icons.arrow_forward_ios,
              //     // Icons.arrow_drop_down_sharp,
              //     color: Colors.white,
              //     size: 25 / FontSizeScale,
              //   ),
              // ),
              Expanded(
                child: Text(
                  widget.buttonLabel,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20 / FontSizeScale,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
        // widget.containersVisible
        //     ? Column(children: widget.infoContainersList)
        //     : const SizedBox(),

        AnimatedSize(
          // vsync: this,
          // height: widget.containersVisible ? null : 0,

          duration: Duration(milliseconds: 300),

          child: SizedBox(
              height: widget.containersVisible ? null : 0,
              child: Column(children: widget.infoContainersList)
          )
        )

      ],
    );
  }
}

class ChangesDuringPregnancyScreen extends StatefulWidget {
  @override
  _ChangesDuringPregnancyScreenState createState() =>
      _ChangesDuringPregnancyScreenState();
}

class _ChangesDuringPregnancyScreenState
    extends State<ChangesDuringPregnancyScreen> {
  @override
  Widget build(BuildContext context) {
    double FontSizeScale = MediaQuery.of(context).textScaleFactor;
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(192, 244, 246, 1),
      body: Container(
        padding: EdgeInsets.fromLTRB(15.0, 60.0, 15.0, 10.0),
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title
                Text(
                  Words[Lang]!['changesDuringPregnancyTitle']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30 / FontSizeScale,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // I-trimester
                Trimester(
                    buttonLabel: "I-${Words[Lang]!['trimester']!}",
                    infoContainersList: [
                      infoContainer(
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['I-1-title']!}:\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            WidgetSpan(
                                child: Icon(
                              Icons.circle,
                              size: 15 / FontSizeScale,
                            )),
                            TextSpan(
                              text: "  ${Words[Lang]!['I-1-1']!}\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                              ),
                            ),
                            WidgetSpan(
                                child: Icon(
                              Icons.circle,
                              size: 15 / FontSizeScale,
                            )),
                            TextSpan(
                              text: "  ${Words[Lang]!['I-1-2']!}\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                              ),
                            ),
                            WidgetSpan(
                                child: Icon(
                              Icons.circle,
                              size: 15 / FontSizeScale,
                            )),
                            TextSpan(
                              text: "  ${Words[Lang]!['I-1-3']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                              ),
                            ),
                          ],
                          recommendationText:
                              Words[Lang]!['I-1-recommendationText']!),
                      infoContainer(
                          riskType: "doubt",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['I-2-title']!}:\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            WidgetSpan(
                                child: Icon(
                              Icons.circle,
                              size: 15 / FontSizeScale,
                            )),
                            TextSpan(
                              text: "  ${Words[Lang]!['I-2-1']!}\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                              ),
                            ),
                            WidgetSpan(
                                child: Icon(
                              Icons.circle,
                              size: 15 / FontSizeScale,
                            )),
                            TextSpan(
                              text: "  ${Words[Lang]!['I-2-2']!}\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                              ),
                            ),
                            WidgetSpan(
                                child: Icon(
                              Icons.circle,
                              size: 15 / FontSizeScale,
                            )),
                            TextSpan(
                              text: "  ${Words[Lang]!['I-2-3']!}\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                              ),
                            ),
                            WidgetSpan(
                                child: Icon(
                              Icons.circle,
                              size: 15 / FontSizeScale,
                            )),
                            TextSpan(
                              text: "  ${Words[Lang]!['I-2-4']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                              ),
                            ),
                          ],
                          recommendationText:
                              Words[Lang]!['I-2-recommendationText']!),
                      infoContainer(
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['I-3-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                              Words[Lang]!['I-3-recommendationText']!),
                      infoContainer(
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['I-4-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                              Words[Lang]!['I-4-recommendationText']!),
                      infoContainer(
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['I-5-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                              Words[Lang]!['I-5-recommendationText']!),
                      infoContainer(
                          riskType: 'doubt',
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['I-6-title']!}:\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            WidgetSpan(
                                child: Icon(
                              Icons.circle,
                              size: 15 / FontSizeScale,
                            )),
                            TextSpan(
                              text: "  ${Words[Lang]!['I-6-1']!}\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                              ),
                            ),
                            WidgetSpan(
                                child: Icon(
                              Icons.circle,
                              size: 15 / FontSizeScale,
                            )),
                            TextSpan(
                              text: "  ${Words[Lang]!['I-6-2']!}\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                              ),
                            ),
                          ],
                          recommendationText:
                              Words[Lang]!['I-6-recommendationText']!),
                      infoContainer(
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['I-7-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                              Words[Lang]!['I-7-recommendationText']!),
                      infoContainer(
                          riskType: "doubt",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['I-8-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                              Words[Lang]!['I-8-recommendationText']!),
                      infoContainer(
                          riskType: "problem",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['I-9-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                              Words[Lang]!['I-9-recommendationText']!),
                    ]),

                // II-trimester
                Trimester(
                    buttonLabel: "II-${Words[Lang]!['trimester']!}",
                    infoContainersList: [
                      infoContainer(
                          riskType: "doubt",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['II-1-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                              Words[Lang]!['II-1-recommendationText']!),
                      infoContainer(
                          riskType: "doubt",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['II-2-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                              Words[Lang]!['II-2-recommendationText']!),
                      infoContainer(
                          riskType: "doubt",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['II-3-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                              Words[Lang]!['II-3-recommendationText']!),
                      infoContainer(
                          riskType: "doubt",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['II-4-title']!}:\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            WidgetSpan(
                                child: Icon(
                                  Icons.circle,
                                  size: 15 / FontSizeScale,
                                )),
                            TextSpan(
                              text: "  ${Words[Lang]!['II-4-1']!}\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                              ),
                            ),

                            WidgetSpan(
                                child: Icon(
                                  Icons.circle,
                                  size: 15 / FontSizeScale,
                                )),
                            TextSpan(
                              text: "  ${Words[Lang]!['II-4-2']!}\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                              ),
                            ),

                            WidgetSpan(
                                child: Icon(
                                  Icons.circle,
                                  size: 15 / FontSizeScale,
                                )),
                            TextSpan(
                              text: "  ${Words[Lang]!['II-4-3']!}\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                              ),
                            ),

                            WidgetSpan(
                                child: Icon(
                                  Icons.circle,
                                  size: 15 / FontSizeScale,
                                )),
                            TextSpan(
                              text: "  ${Words[Lang]!['II-4-4']!}\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                              ),
                            ),


                          ],
                          recommendationText:
                          Words[Lang]!['II-4-recommendationText']!),
                      infoContainer(
                          riskType: "doubt",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['II-5-title']!}:\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            WidgetSpan(
                                child: Icon(
                                  Icons.circle,
                                  size: 15 / FontSizeScale,
                                )),
                            TextSpan(
                              text: "  ${Words[Lang]!['II-5-1']!}\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                              ),
                            ),

                            WidgetSpan(
                                child: Icon(
                                  Icons.circle,
                                  size: 15 / FontSizeScale,
                                )),
                            TextSpan(
                              text: "  ${Words[Lang]!['II-5-2']!}\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                              ),
                            ),

                            WidgetSpan(
                                child: Icon(
                                  Icons.circle,
                                  size: 15 / FontSizeScale,
                                )),
                            TextSpan(
                              text: "  ${Words[Lang]!['II-5-3']!}\n",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                              ),
                            ),


                          ],
                          recommendationText:
                          Words[Lang]!['II-5-recommendationText']!),
                      infoContainer(
                          riskType: "doubt",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['II-6-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['II-6-recommendationText']!),
                      infoContainer(
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['II-7-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['II-7-recommendationText']!),
                      infoContainer(
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['II-8-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['II-8-recommendationText']!),
                      infoContainer(
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['II-9-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['II-9-recommendationText']!),
                      infoContainer(
                          riskType: "doubt",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['II-10-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['II-10-recommendationText']!),
                      infoContainer(
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['II-11-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['II-11-recommendationText']!),
                      infoContainer(
                          riskType: "doubt",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['II-12-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['II-12-recommendationText']!),
                    ]),

                // III-trimester
                Trimester(
                    buttonLabel: "III-${Words[Lang]!['trimester']!}",
                    infoContainersList: [
                      infoContainer(
                          riskType: "doubt",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['III-1-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['III-1-recommendationText']!),
                      infoContainer(
                          riskType: "doubt",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['III-2-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['III-2-recommendationText']!),
                      infoContainer(
                          riskType: "doubt",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['III-3-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['III-3-recommendationText']!),
                      infoContainer(
                          riskType: "problem",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['III-4-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['III-4-recommendationText']!),
                      infoContainer(
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['III-5-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['III-5-recommendationText']!),
                      infoContainer(
                          riskType: "doubt",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['III-6-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['III-6-recommendationText']!),
                      infoContainer(
                          riskType: "doubt",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['III-7-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['III-7-recommendationText']!),
                      infoContainer(
                          riskType: "doubt",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['III-8-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['III-8-recommendationText']!),
                      infoContainer(
                          riskType: "doubt",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['III-9-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['III-9-recommendationText']!),
                      infoContainer(
                          riskType: "problem",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['III-10-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['III-10-recommendationText']!),
                      infoContainer(
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['III-11-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['III-11-recommendationText']!),
                      infoContainer(
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['III-12-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['III-12-recommendationText']!),
                      infoContainer(
                          riskType: "doubt",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['III-13-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['III-13-recommendationText']!),
                      infoContainer(
                          riskType: "problem",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['III-14-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['III-14-recommendationText']!),
                      infoContainer(
                          riskType: "problem",
                          contentList: [
                            TextSpan(
                              text: "  ${Words[Lang]!['III-15-title']!}",
                              style: TextStyle(
                                fontSize: 18 / FontSizeScale,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          recommendationText:
                          Words[Lang]!['III-15-recommendationText']!),
                    ]
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
