import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:retail/clicktoadd_screen.dart';
import 'package:retail/constansts.dart';
import 'package:retail/notifications.dart';
import 'package:retail/shop_screen.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreeState();
}

class _homescreeState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      // leading: const Icon(
      //   Icons.arrow_back_ios,
      //   color: Color(0xff77E2FE),
      // ),
      title: Container(
        child: Image.asset("images/retailtextlogo.png"),
        width: 120,
        height: 80,
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => qrscanner()));
            },
            icon: const Icon(
              Icons.qr_code_2,
              color: Color(0xff77E2FE),
            )),
      ],
      headerWidget: headerWidget(context),
      headerBottomBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => qrscanner()));
              },
              icon: const Icon(
                Icons.qr_code_2,
                color: Color(0xff77E2FE),
              )),
        ],
      ),
      body: [listView()],
      fullyStretchable: true,
      backgroundColor: Color(khalfwhite),
      appBarColor: Color(khalfwhite),
    );
  }
}

Widget headerWidget(BuildContext context) {
  return Container(
    height: 200,
    color: Colors.white,
    child: Center(
      child: Image.asset("images/retaillogo.png"),
    ),
  );
}

class homepagebody extends StatelessWidget {
  const homepagebody({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: double.infinity,
    //   padding: EdgeInsets.all(10),
    //   color: Color(0xffF5F5F5),
    //   child:
    return ListView(
      children: [
        Text(
          "Click to explore deals",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        shop_card("D-Mart", "Pondamalle"),
        shop_card("Grace", "KK Nagar"),
        shop_card("D-Mart", "Pondamalle"),
        shop_card("Grace", "KK Nagar"),
        shop_card("D-Mart", "Pondamalle"),
      ],
    );
  }
}

ListView listView() {
  return ListView.builder(
    padding: const EdgeInsets.only(top: 0),
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 20,
    shrinkWrap: true,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10)),
        ),
        child: shop_card("Shop_name", "shop_location"),
      ),
    ),
  );
}

class shop_card extends StatelessWidget {
  final String Shop_name;
  final String shop_location;
  shop_card(this.Shop_name, this.shop_location);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => shop_screen(Shop_name)));
        NotificationServices().showNotification(
            title: 'Hurry!!', body: '15% offer on your favourite choclate');
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(0),
        height: 150,
        width: double.infinity,
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
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Shop_name.toUpperCase(),
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Row(
                  children: [
                    Icon(Icons.place, color: Colors.red),
                    Text(
                      shop_location,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    height: 50,
                    width: 50,
                    child: Center(
                        child: Text(
                      ">",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ))),
                SizedBox(
                  height: 3,
                ),
                // Text(
                //   "Explore Deals",
                //   style:
                //       TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
