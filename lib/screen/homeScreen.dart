import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ms_motors_app_flutter/constantColor.dart';
import 'package:ms_motors_app_flutter/widget/appBarMsMotors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var _h = MediaQuery.of(context).size.height;
    var _w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: black,
        height: _h,
        width: _w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              appBarMsMotors(_h, _w),
              Container(
                height: _h * 0.30,
                width: _w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        colorFilter: ColorFilter.srgbToLinearGamma(),
                        image: NetworkImage(
                            'https://msmotors.fr/wp-content/uploads/2018/02/banner-home.jpg'))),
                child: Text(
                  'Bienvenue \n chez\n MsMotors',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w700,
                      fontSize: _h * 0.05,
                      shadows: [
                        Shadow(
                            offset: Offset(2, 2), color: black, blurRadius: 25)
                      ]),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Container(
                height: _h * 0.10,
                width: _w * 0.95,
                child: Row(
                  children: [
                    Container(
                      height: _h * 0.015,
                      width: _h * 0.015,
                      decoration: BoxDecoration(
                          color: orange,
                          borderRadius: BorderRadius.circular(2.5)),
                    ),
                    Padding(padding: EdgeInsets.all(2.5)),
                    Container(
                      width: _w * 0.905,
                      child: Text(
                        'NOS NOUVEAUX VÉHICULES',
                        style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: _h * 0.03),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: _h * 0.5,
                width: _w,
                child: FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('Voiture')
                      .orderBy('Date', descending: true)
                      .get(),
                  builder: (context, snapshot) {
                    List<Widget> widgetCrou = [];
                    for (var i = 0; i < snapshot.data!.docs.length; i++) {
                      widgetCrou.add(Container(
                        color: grey,
                        margin: EdgeInsets.all(_w * 0.025),
                        height: _h * 0.25,
                        width: _w * 0.9,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: _h * 0.25,
                                width: _w * 0.9,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: orange, width: 3)),
                                    image: DecorationImage(
                                        fit: BoxFit.fitHeight,
                                        image: NetworkImage(
                                            snapshot.data!.docs[i]['IMG'][0]))),
                              ),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  width: _w * 0.9,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        snapshot.data!.docs[i]['Marque']
                                            .toString()
                                            .toUpperCase(),
                                        style: TextStyle(
                                            color: orange,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        snapshot.data!.docs[i]['PRIX']
                                                .toString()
                                                .toUpperCase() +
                                            ' €',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                              Container(
                                padding: EdgeInsets.all(10),
                                width: _w * 0.9,
                                child: Text(
                                  snapshot.data!.docs[i]['Model']
                                      .toString()
                                      .toUpperCase(),
                                  style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ));
                    }
                    return CarouselSlider(
                        options: CarouselOptions(
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                            height: _h * 0.425,
                            enableInfiniteScroll: false,
                            viewportFraction: 0.75),
                        items: widgetCrou);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
