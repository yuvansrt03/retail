import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';

import 'clicktoadd_screen.dart';
import 'fav_screen.dart';
import 'home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        title: "Draggable Home",
        home: landing(),
      );
}

class landing extends StatefulWidget {
  const landing({super.key});

  @override
  State<landing> createState() => _landingState();
}

class _landingState extends State<landing> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
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
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      leading: const Icon(Icons.arrow_back_ios),
      title: const Text("Draggable Home"),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
      headerWidget: headerWidget(context),
      headerBottomBar: headerBottomBarWidget(),
      body: [],
      fullyStretchable: true,
      backgroundColor: Colors.white,
      appBarColor: Colors.teal,
    );
  }

  Row headerBottomBarWidget() {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          "Title",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.white70),
        ),
      ),
    );
  }

//   ListView listView() {
//     return ListView.builder(
//       padding: const EdgeInsets.only(top: 0),
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: 20,
//       shrinkWrap: true,
//       itemBuilder: (context, index) => Card(
//         color: Colors.white70,
//         child: ListTile(
//           leading: CircleAvatar(
//             child: Text("$index"),
//           ),
//           title: const Text("Title"),
//           subtitle: const Text("Subtitle"),
//         ),
//       ),
//     );
//   }
// }
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
