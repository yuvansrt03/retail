import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'constansts.dart';

// ignore: must_be_immutable
class productcard extends StatelessWidget {
  String imagepath;
  String productname;
  String proddescription;
  String sp;
  String offer;

  productcard(
    this.imagepath,
    this.productname,
    this.proddescription,
    this.sp,
    this.offer,
  );

  @override
  Widget build(BuildContext context) {
    String truncateString(String text, int maxLength) {
      if (text.length <= maxLength) {
        return text; // Return the original string if it's already shorter than the limit.
      } else {
        return text.substring(
            0, maxLength); // Return the first maxLength characters.
      }
    }

    String imgurl = 'http://192.168.8.128:8080$imagepath';
    // double offer = ((mrp - sp) / mrp) * 100;
    // int offerpercetage = offer.toInt();
    return GestureDetector(
      onTap: () {
        showGeneralDialog(
          context: context,
          barrierLabel: "Barrier",
          barrierDismissible: true,
          barrierColor: Colors.black.withOpacity(0.5),
          transitionDuration: Duration(milliseconds: 700),
          pageBuilder: (_, __, ___) {
            return Center(
              child: Container(
                height: 300,
                child: SizedBox.expand(
                    child: Container(
                        child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Image.network(imgurl),
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ),
                    Container(
                      width: 170,
                      height: 150,
                      child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                productname,
                                style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ),
                            Text(
                              '₹$sp',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                "M.R.P:₹",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                truncateString(proddescription, 50) + '...',
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ))),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
              ),
            );
          },
          transitionBuilder: (_, anim, __, child) {
            Tween<Offset> tween;
            if (anim.status == AnimationStatus.reverse) {
              tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
            } else {
              tween = Tween(begin: Offset(1, 0), end: Offset.zero);
            }

            return SlideTransition(
              position: tween.animate(anim),
              child: FadeTransition(
                opacity: anim,
                child: child,
              ),
            );
          },
        );
      },
      child: Expanded(
        child: Container(
          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
          height: 200,
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Shimmer.fromColors(
                    baseColor: Color(0xff46BDFA), // Shimmer base color
                    highlightColor:
                        Color(0xff77E2FE), // Shimmer highlight color
                    child: Container(
                      height: 25,
                      width: 80,
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
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 80,
                    child: Center(
                      child: Text(
                        truncateString(offer, 2) + "%",
                        style: TextStyle(
                          color: Color(kwhite),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 2, 5, 10),
                height: 120,
                width: double.infinity,
                // color: Color(kdarkcolor),
                child: Image.network(imgurl),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                child: Text(
                  productname,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                child: Row(
                  children: [
                    Text(
                      '₹$sp',
                      style: TextStyle(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "₹",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '$offer% OFF',
                  style: TextStyle(
                    color: Colors.red,
                    //fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
