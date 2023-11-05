// import 'package:flutter/material.dart';
// import 'package:retail/imagecaurosel.dart';
// import 'package:retail/products_card.dart';
// import 'package:http/http.dart' as http;
// import 'dealsoftheday_card.dart';
// import 'dart:convert';
// import 'package:dio/dio.dart';

// // Future<void> fetchData() async {
// //   print("first");
// //   final String apiUrl =
// //       'http://127.0.0.1:5000/api/products/all'; // Replace with the API URL you want to use.
// //   final response = await http.get(Uri.parse(apiUrl));
// //   print("hey");
// //   // print(jsonDecode(response.body));
// //   if (response.statusCode == 200) {
// //     print("object");
// //     // Request was successful, and you can parse the response.
// //     //final data = response.body;
// //     String data = response.body;
// //     data = jsonDecode(data);
// //     print('Response Data: $data');
// //   } else {
// //     // Request failed or returned an error status code.
// //     print('Failed to fetch data. Status Code: ${response.statusCode}');
// //   }
// // }
// const String API_URL = 'http://192.168.8.128:8080/api/products/all';
// List jsondata = [];

// // Make a GET request to the API endpoint
// final dio = Dio();

// // Make a GET request to the API endpoint
// Future<dynamic> getApiData() async {
//   final response = await dio.get(API_URL);

//   // Check the status code of the response
//   if (response.statusCode == 200) {
//     print("object");
//     print(response.data);
//     jsondata = response.data;
//     print(jsondata);

//     // Success! Return the JSON response body
//     print("success");
//   } else {
//     // Something went wrong
//     throw Exception('Failed to get API data: ${response.statusCode}');
//   }
// }

// class shop_screen extends StatefulWidget {
//   final String shopname;
//   shop_screen(this.shopname);

//   @override
//   State<shop_screen> createState() => _shop_screenState();
// }

// class _shop_screenState extends State<shop_screen> {
//   List<Map<String, dynamic>> productList = [];
//   Future<void> fetchData() async {
//     final response = await Dio().get(API_URL);

//     if (response.statusCode == 200) {
//       final jsonData = response.data;
//       if (jsonData is List) {
//         setState(() {
//           productList = jsonData.cast<Map<String, dynamic>>();
//         });
//       } else {
//         print('Invalid data format');
//       }
//     } else {
//       print('Failed to fetch data. Status Code: ${response.statusCode}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           leading: GestureDetector(
//             onTap: () async {
//               await getApiData();
//             },
//             child: Icon(
//               Icons.arrow_left_rounded,
//               color: Colors.black,
//               size: 50,
//             ),
//           ),
//           title: Text(
//             widget.shopname,
//             style: TextStyle(color: Colors.black),
//           ),
//           backgroundColor: Colors.white,
//         ),
//         body: Container(
//           // ... Your existing code for building the UI
//           // You can use the 'productList' to display product information using deals_of_the_day_card
//           child: ListView.builder(
//             itemCount: productList.length,
//             itemBuilder: (context, index) {
//               final product = productList[index];
//               return dealsoftheday_card(
//                 product['productImage'],
//                 product['productName'],
//                 product['productDescription'],
//                 int.parse(product['productCostPrice']),
//                 int.parse(product['productDiscountPercentage']),
//               );
//             },
//           ),
//         ),
//       ),
//     ));
//     //Container(
//     //           width: double.infinity,
//     //           padding: EdgeInsets.all(7),
//     //           color: Colors.white,
//     //           child: ListView(
//     //             scrollDirection: Axis.vertical,
//     //             children: [
//     //               Container(
//     //                 decoration:
//     //                     BoxDecoration(borderRadius: BorderRadius.circular(15)),
//     //                 child: ImageCarousel(215, [
//     //                   'images/C1.jpg',
//     //                   'images/C2.jpg',
//     //                   'images/C3.jpg',
//     //                   'images/C4.jpg',
//     //                   'images/C5.jpg',
//     //                   'images/C6.jpg',
//     //                   'images/C7.jpg',
//     //                   'images/C8.jpg',
//     //                   'images/C9.jpg',
//     //                   'images/C10.jpg',
//     //                 ]),
//     //               ),
//     //               SizedBox(
//     //                 height: 5,
//     //               ),
//     //               Text(
//     //                 "Deals of the day",
//     //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//     //               ),
//     //               SizedBox(
//     //                 height: 210,
//     //                 child: ListView(
//     //                   scrollDirection: Axis.horizontal,
//     //                   children: [
//     //                     dealsoftheday_card('images/amul.jpeg', 'Amul',
//     //                         "description of the product", 50, 100),
//     //                     dealsoftheday_card('images/amul.jpeg', 'Amul',
//     //                         "description of the product", 50, 100),
//     //                     dealsoftheday_card('images/amul.jpeg', 'Amul',
//     //                         "description of the product", 50, 100),
//     //                     dealsoftheday_card('images/amul.jpeg', 'Amul',
//     //                         "description of the product", 50, 100),
//     //                   ],
//     //                 ),
//     //               ),
//     //               SizedBox(
//     //                 height: 5,
//     //               ),
//     //               Text(
//     //                 "Recommended for you",
//     //                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//     //               ),
//     //               SizedBox(
//     //                 height: 5,
//     //               ),
//     //               SizedBox(
//     //                 height: 245,
//     //                 width: double.infinity,
//     //                 child: ListView(
//     //                   scrollDirection: Axis.horizontal,
//     //                   children: [
//     //                     productcard('images/amul.jpeg', 'Amul',
//     //                         "description of the product", 50, 100),
//     //                     productcard('images/amul.jpeg', 'Amul',
//     //                         "description of the product", 50, 100),
//     //                     productcard('images/amul.jpeg', 'Amul',
//     //                         "description of the product", 50, 100),
//     //                     productcard('images/amul.jpeg', 'Amul',
//     //                         "description of the product", 50, 100),
//     //                   ],
//     //                 ),
//     //               ),
//     //             ],
//     //           )),
//     //     ),
//     //   ),
//     // );
//   }
// }
import 'package:flutter/material.dart';
import 'package:retail/notifications.dart';
import 'package:retail/products_card.dart';
import 'package:retail/productscarddj.dart';
import 'dealsdj.dart';
import 'dealsoftheday_card.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

import 'imagecaurosel.dart';

const String API_URL = 'http://192.168.8.128:8080/api/products/all';
const String recourl =
    'http://192.168.8.128:8080/api/products/1/getRecommendations';

class shop_screen extends StatefulWidget {
  final String shopname;
  shop_screen(this.shopname);

  @override
  State<shop_screen> createState() => _shop_screenState();
}

class _shop_screenState extends State<shop_screen> {
  List<Map<String, dynamic>> productList = [];
  List<Map<String, dynamic>> recolist = [];

  Future<void> fetchData() async {
    final response = await Dio().get(API_URL);

    if (response.statusCode == 200) {
      final jsonData = response.data;
      if (jsonData is List) {
        setState(() {
          productList = jsonData.cast<Map<String, dynamic>>();
        });
        print("sucess");
      } else {
        print('Invalid data format');
      }
    } else {
      print('Failed to fetch data. Status Code: ${response.statusCode}');
    }
  }

  Future<void> fetchrecommendationdata() async {
    final response = await Dio().get(recourl);

    if (response.statusCode == 200) {
      final jsonData = response.data;
      if (jsonData is List) {
        setState(() {
          recolist = jsonData.cast<Map<String, dynamic>>();
        });
        print("sucess");
        print(response.data);
      } else {
        print('Invalid data format');
      }
    } else {
      print('Failed to fetch data. Status Code: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchrecommendationdata();
    NotificationServices().showNotification(
        title: 'Hurry!!', body: '15% offer on your favourite choclate');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.shopname,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  width: 80,
                ),
                IconButton(
                    onPressed: () => NotificationServices().showNotification(
                        title: 'Hurry!!',
                        body: '15% offer on your favourite choclate'),
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.black,
                    )),
              ],
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
                    child: ImageCarousel(230, [
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
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Deals of the day",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    child: dealsdj(productList: productList),
                    height: 200,
                  ),
                  SizedBox(
                    height: 7,
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
                    child: SizedBox(
                      child: proddj(
                        recolist: recolist,
                      ),
                      height: 200,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
