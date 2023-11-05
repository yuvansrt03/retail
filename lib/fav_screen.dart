// import 'package:flutter/material.dart';

// class NotificationsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notifications'),
//       ),
//       body: ListView.builder(
//         itemCount: 20, // Generate 20 notifications
//         itemBuilder: (context, index) {
//           final productName = 'Product ${index + 1}';
//           final description = 'Description for $productName';
//           return ListTile(
//             title: Text(productName),
//             subtitle: Text(description),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
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
