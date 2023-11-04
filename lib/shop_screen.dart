import 'package:flutter/material.dart';
import 'package:retail/imagecaurosel.dart';
import 'package:retail/products_card.dart';
import 'package:shimmer/shimmer.dart';

import 'constansts.dart';

class shop_screen extends StatefulWidget {
  final String shopname;
  shop_screen(this.shopname);

  @override
  State<shop_screen> createState() => _shop_screenState();
}

class _shop_screenState extends State<shop_screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_left_rounded,
                color: Colors.black,
                size: 50,
              ),
            ),
            title: Text(
              widget.shopname,
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
          body: Container(
              width: double.infinity,
              padding: EdgeInsets.all(7),
              color: Colors.white,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: ImageCarousel(215, [
                      'images/C1.jpg',
                      'images/C2.jpg',
                      'images/C3.jpg',
                      'images/C4.jpg',
                      'images/C5.jpg',
                      'images/C6.jpg',
                      'images/C7.jpg',
                      'images/C8.jpg',
                      'images/C9.jpg',
                      'images/C10.jpg',
                    ]),
                  ),
                  Text(
                    "Recommended for you",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 245,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        productcard(
                          30,
                          'images/amul.jpeg',
                          'Amul',
                          209,
                          299,
                          10,
                          0,
                          180,
                        ),
                        productcard(
                          10,
                          'images/bread.jpeg',
                          'Bread',
                          285,
                          300,
                          10,
                          0,
                          180,
                        ),
                        productcard(
                          50,
                          'images/milk.jpg',
                          'Milk',
                          196,
                          229,
                          10,
                          0,
                          180,
                        ),
                        productcard(
                          25,
                          'images/amul.jpeg',
                          'Wow',
                          150,
                          215,
                          10,
                          0,
                          180,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Deals of the day",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 8,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          height: 220,
                          width: 150,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Shimmer.fromColors(
                                        baseColor: Color(
                                            0xff46BDFA), // Shimmer base color
                                        highlightColor: Color(
                                            0xff77E2FE), // Shimmer highlight color
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                // Start color
                                                Color(0xff77E2FE),
                                                Color(0xff46BDFA), // End color
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          height: 25,
                                          width: 80,
                                          child: Center(
                                            child: Text(
                                              "50%",
                                              style: TextStyle(
                                                color: Color(kwhite),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                child: Image.asset('images/amul.jpeg'),
                                height: 110,
                                width: 140,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  "dfg",
                                  style: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),

                              // Padding(
                              //   padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                              //   child: Text(
                              //     producttype,
                              //     style: TextStyle(
                              //       color: Colors.grey.shade600,
                              //     ),
                              //   ),
                              // ),
                              Text(
                                '₹50',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.grey.shade900,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                                child: Text(
                                  "M.R.P:₹100",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
