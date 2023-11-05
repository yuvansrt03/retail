// import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
// import 'package:draggable_home/draggable_home.dart';
// import 'package:flutter/material.dart';

// import 'clicktoadd_screen.dart';
// import 'fav_screen.dart';
// import 'home_screen.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) => const MaterialApp(
//         title: "Draggable Home",
//         home: landing(),
//       );
// }

// class landing extends StatefulWidget {
//   const landing({super.key});

//   @override
//   State<landing> createState() => _landingState();
// }

// class _landingState extends State<landing> {
//   int _selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: HomePage(),
//       bottomNavigationBar: DiamondBottomNavigation(
//         itemIcons: const [
//           Icons.home,
//           Icons.favorite,
//         ],
//         centerIcon: Icons.qr_code_2,
//         selectedIndex: _selectedIndex,
//         onItemPressed: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return DraggableHome(
//       leading: const Icon(Icons.arrow_back_ios),
//       title: const Text("Draggable Home"),
//       actions: [
//         IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
//       ],
//       headerWidget: headerWidget(context),
//       headerBottomBar: headerBottomBarWidget(),
//       body: [],
//       fullyStretchable: true,
//       backgroundColor: Colors.white,
//       appBarColor: Colors.teal,
//     );
//   }

//   Row headerBottomBarWidget() {
//     return const Row(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.end,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Icon(
//           Icons.settings,
//           color: Colors.white,
//         ),
//       ],
//     );
//   }

//   Widget headerWidget(BuildContext context) {
//     return Container(
//       color: Colors.blue,
//       child: Center(
//         child: Text(
//           "Title",
//           style: Theme.of(context)
//               .textTheme
//               .displayMedium!
//               .copyWith(color: Colors.white70),
//         ),
//       ),
//     );
//   }

// //   ListView listView() {
// //     return ListView.builder(
// //       padding: const EdgeInsets.only(top: 0),
// //       physics: const NeverScrollableScrollPhysics(),
// //       itemCount: 20,
// //       shrinkWrap: true,
// //       itemBuilder: (context, index) => Card(
// //         color: Colors.white70,
// //         child: ListTile(
// //           leading: CircleAvatar(
// //             child: Text("$index"),
// //           ),
// //           title: const Text("Title"),
// //           subtitle: const Text("Subtitle"),
// //         ),
// //       ),
// //     );
// //   }
// // }
//   Widget _buildPage(int index) {
//     switch (index) {
//       case 0:
//         return homescreen();
//       case 1:
//         return qrscanner();
//       case 2:
//         return FavScreen();
//       default:
//         return qrscanner();
//     }
//   }
// }
// ???????????????????????

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
//   Future<void> fetchData() async {
//     final response = await Dio().get(API_URL);

//     if (response.statusCode == 200) {
//       final jsonData = response.data;
//       if (jsonData is List) {
//         setState(() {
//           var productList = jsonData.cast<Map<String, dynamic>>();
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
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           appBar: AppBar(
//             leading: GestureDetector(
//               onTap: () async {
//                 await getApiData();
//               },
//               child: Icon(
//                 Icons.arrow_left_rounded,
//                 color: Colors.black,
//                 size: 50,
//               ),
//             ),
//             title: Text(
//               widget.shopname,
//               style: TextStyle(color: Colors.black),
//             ),
//             backgroundColor: Colors.white,
//           ),
//           body: Container(
//               width: double.infinity,
//               padding: EdgeInsets.all(7),
//               color: Colors.white,
//               child: ListView(
//                 scrollDirection: Axis.vertical,
//                 children: [
//                   Container(
//                     decoration:
//                         BoxDecoration(borderRadius: BorderRadius.circular(15)),
//                     child: ImageCarousel(215, [
//                       'images/C1.jpg',
//                       'images/C2.jpg',
//                       'images/C3.jpg',
//                       'images/C4.jpg',
//                       'images/C5.jpg',
//                       'images/C6.jpg',
//                       'images/C7.jpg',
//                       'images/C8.jpg',
//                       'images/C9.jpg',
//                       'images/C10.jpg',
//                     ]),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     "Deals of the day",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 210,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         dealsoftheday_card('images/amul.jpeg', 'Amul',
//                             "description of the product", 50, 100),
//                         dealsoftheday_card('images/amul.jpeg', 'Amul',
//                             "description of the product", 50, 100),
//                         dealsoftheday_card('images/amul.jpeg', 'Amul',
//                             "description of the product", 50, 100),
//                         dealsoftheday_card('images/amul.jpeg', 'Amul',
//                             "description of the product", 50, 100),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     "Recommended for you",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   SizedBox(
//                     height: 245,
//                     width: double.infinity,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         productcard('images/amul.jpeg', 'Amul',
//                             "description of the product", 50, 100),
//                         productcard('images/amul.jpeg', 'Amul',
//                             "description of the product", 50, 100),
//                         productcard('images/amul.jpeg', 'Amul',
//                             "description of the product", 50, 100),
//                         productcard('images/amul.jpeg', 'Amul',
//                             "description of the product", 50, 100),
//                       ],
//                     ),
//                   ),
//                 ],
//               )),
//         ),
//       ),
//     );
//   }
// }
