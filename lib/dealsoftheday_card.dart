import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class dealsoftheday_card extends StatelessWidget {
  String imagepath;
  String productname;
  String proddescription;
  String sp;
  String offer;

  dealsoftheday_card(
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
    // double offer = 0;
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
                                "M.R.P:₹$int.parse",
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
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return Center(
        //       child: Container(
        //         color: Colors.amberAccent,
        //         height: 500, // Set the height as per your preference
        //         child: SimpleDialog(
        //           title: Text('Simple Dialog Example'),
        //           children: <Widget>[
        //             SimpleDialogOption(
        //               onPressed: () {
        //                 Navigator.pop(context);
        //               },
        //               child: Text('Option 1'),
        //             ),
        //             SimpleDialogOption(
        //               onPressed: () {
        //                 Navigator.pop(context);
        //               },
        //               child: Text('Option 2'),
        //             ),
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // );
      },
      child: Card(
        elevation: 8,
        child: Container(
          padding: EdgeInsets.all(5),
          height: 190,
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
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      Container(
                        child: Image.network(imgurl),
                        height: 110,
                        width: 140,
                      ),
                      Shimmer.fromColors(
                        baseColor: Color(0xffFF0000), // Shimmer base color
                        highlightColor:
                            Color(0xffFF4500), // Shimmer highlight color
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                // Start color
                                Color(0xffFF4500),
                                Color(0xffFF0000), // End color
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height:
                              50, // Adjust the height to match the shimmering container
                          width:
                              50, // Adjust the width to match the shimmering container
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors
                                .transparent, // Set a transparent background
                          ),
                          child: Center(
                            child: Text(
                              truncateString(offer, 2) + "%",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
              Text(
                '₹$sp',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                child: Text(
                  "M.R.P:₹$sp",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      decoration: TextDecoration.lineThrough),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
