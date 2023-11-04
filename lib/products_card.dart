import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'constansts.dart';

// ignore: must_be_immutable
class productcard extends StatelessWidget {
  int offerpercentage;
  String imagepath;
  String productname;

  int sp;
  int mrp;
  double marginright;
  double marginbottom;
  double width;
  productcard(this.offerpercentage, this.imagepath, this.productname, this.sp,
      this.mrp, this.marginright, this.marginbottom, this.width);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(5, 0, marginright, marginbottom),
        height: 200,
        width: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Shimmer.fromColors(
                  baseColor: Color(0xff46BDFA), // Shimmer base color
                  highlightColor: Color(0xff77E2FE), // Shimmer highlight color
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
                      "$offerpercentage% OFF",
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
              child: Image.asset(imagepath),
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
                    "₹$mrp",
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
                '$offerpercentage% OFF',
                style: TextStyle(
                  color: Colors.red,
                  //fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
