import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:retail/home_screen.dart';
import 'clicktoadd_screen.dart';

import 'fav_screen.dart';
import 'login_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
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
          Icons.notifications,
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

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: 20, // Generate 20 notifications
        itemBuilder: (context, index) {
          final productName = 'Product ${index + 1}';
          final description = 'Description for $productName';
          return ListTile(
            title: Text(productName),
            subtitle: Text(description),
          );
        },
      ),
    );
  }
}
