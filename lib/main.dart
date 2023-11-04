import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:retail/home_screen.dart';
import 'clicktoadd_screen.dart';
import 'constansts.dart';
import 'fav_screen.dart';

void main(List<String> args) {
  runApp(RetailApp());
}

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
        return QRScreen();
      case 2:
        return FavScreen();
      default:
        return QRScreen();
    }
  }
}
