import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'clicktoadd_screen.dart';
import 'fav_screen.dart';
import 'home_screen.dart';

class RetailApp extends StatelessWidget {
  const RetailApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Row(
      //         children: [
      //           Container(
      //             height: 50,
      //             width: 40,
      //             child: Image.asset(
      //               'lib/images/logo.png',
      //               fit: BoxFit.fill,
      //             ),
      //           ),
      //           Text(
      //             "Retail",
      //             style: TextStyle(color: Colors.black),
      //           ),
      //         ],
      //       ),
      //       CircleAvatar()
      //     ],
      //   ),
      // ),
      body: _buildPage(_selectedIndex),
      bottomNavigationBar: DiamondBottomNavigation(
        itemIcons: const [
          Icons.home,
          Icons.favorite,
        ],
        centerIcon: Icons.qr_code_2,
        selectedIndex: _selectedIndex,
        onItemPressed: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return homescreen();
      case 1:
        return qrscanner();
      case 2:
        return NotificationsScreen();
      default:
        return qrscanner();
    }
  }
}
